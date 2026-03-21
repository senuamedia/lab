; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"coupled_drift"(i64 %r, i64 %coupling, i64 %steps) nounwind {
entry:
  %local.x.9 = alloca i64
  %local.y.10 = alloca i64
  %local.step.11 = alloca i64
  %local.sum_dx.12 = alloca i64
  %local.sum_dy.13 = alloca i64
  %local.prev_x.14 = alloca i64
  %local.prev_y.15 = alloca i64
  %local.count.16 = alloca i64
  %local.xnew.17 = alloca i64
  %local.ynew.18 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t19 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.2)
  store i64 %t19, ptr %local.x.9
  %t20 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.3)
  store i64 %t20, ptr %local.y.10
  store i64 0, ptr %local.step.11
  %t21 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.4)
  store i64 %t21, ptr %local.sum_dx.12
  %t22 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.5)
  store i64 %t22, ptr %local.sum_dy.13
  %t23 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.6)
  store i64 %t23, ptr %local.prev_x.14
  %t24 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.7)
  store i64 %t24, ptr %local.prev_y.15
  store i64 0, ptr %local.count.16
  %t25 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.8)
  store i64 %t25, ptr %local.xnew.17
  %t26 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.9)
  store i64 %t26, ptr %local.ynew.18
  br label %loop1
loop1:
  %t27 = load i64, ptr %local.step.11
  %t28 = icmp slt i64 %t27, 500
  %t29 = zext i1 %t28 to i64
  %t30 = icmp ne i64 %t29, 0
  br i1 %t30, label %body1, label %endloop1
body1:
  %t31 = load i64, ptr %local.r
  %t32 = load i64, ptr %local.x.9
  %t33 = call i64 @"sx_f64_mul"(i64 %t31, i64 %t32)
  %t34 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.10)
  %t35 = load i64, ptr %local.x.9
  %t36 = call i64 @"sx_f64_sub"(i64 %t34, i64 %t35)
  %t37 = call i64 @"sx_f64_mul"(i64 %t33, i64 %t36)
  %t38 = load i64, ptr %local.coupling
  %t39 = load i64, ptr %local.y.10
  %t40 = load i64, ptr %local.x.9
  %t41 = call i64 @"sx_f64_sub"(i64 %t39, i64 %t40)
  %t42 = call i64 @"sx_f64_mul"(i64 %t38, i64 %t41)
  %t43 = call i64 @"sx_f64_add"(i64 %t37, i64 %t42)
  store i64 %t43, ptr %local.xnew.17
  %t44 = load i64, ptr %local.r
  %t45 = load i64, ptr %local.y.10
  %t46 = call i64 @"sx_f64_mul"(i64 %t44, i64 %t45)
  %t47 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.11)
  %t48 = load i64, ptr %local.y.10
  %t49 = call i64 @"sx_f64_sub"(i64 %t47, i64 %t48)
  %t50 = call i64 @"sx_f64_mul"(i64 %t46, i64 %t49)
  %t51 = load i64, ptr %local.coupling
  %t52 = load i64, ptr %local.x.9
  %t53 = load i64, ptr %local.y.10
  %t54 = call i64 @"sx_f64_sub"(i64 %t52, i64 %t53)
  %t55 = call i64 @"sx_f64_mul"(i64 %t51, i64 %t54)
  %t56 = call i64 @"sx_f64_add"(i64 %t50, i64 %t55)
  store i64 %t56, ptr %local.ynew.18
  %t57 = load i64, ptr %local.xnew.17
  store i64 %t57, ptr %local.x.9
  %t58 = load i64, ptr %local.ynew.18
  store i64 %t58, ptr %local.y.10
  %t59 = load i64, ptr %local.step.11
  %t60 = add i64 %t59, 1
  store i64 %t60, ptr %local.step.11
  br label %loop1
endloop1:
  %t61 = load i64, ptr %local.x.9
  store i64 %t61, ptr %local.prev_x.14
  %t62 = load i64, ptr %local.y.10
  store i64 %t62, ptr %local.prev_y.15
  store i64 0, ptr %local.step.11
  br label %loop2
loop2:
  %t63 = load i64, ptr %local.step.11
  %t64 = load i64, ptr %local.steps
  %t65 = icmp slt i64 %t63, %t64
  %t66 = zext i1 %t65 to i64
  %t67 = icmp ne i64 %t66, 0
  br i1 %t67, label %body2, label %endloop2
body2:
  %t68 = load i64, ptr %local.r
  %t69 = load i64, ptr %local.x.9
  %t70 = call i64 @"sx_f64_mul"(i64 %t68, i64 %t69)
  %t71 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.12)
  %t72 = load i64, ptr %local.x.9
  %t73 = call i64 @"sx_f64_sub"(i64 %t71, i64 %t72)
  %t74 = call i64 @"sx_f64_mul"(i64 %t70, i64 %t73)
  %t75 = load i64, ptr %local.coupling
  %t76 = load i64, ptr %local.y.10
  %t77 = load i64, ptr %local.x.9
  %t78 = call i64 @"sx_f64_sub"(i64 %t76, i64 %t77)
  %t79 = call i64 @"sx_f64_mul"(i64 %t75, i64 %t78)
  %t80 = call i64 @"sx_f64_add"(i64 %t74, i64 %t79)
  store i64 %t80, ptr %local.xnew.17
  %t81 = load i64, ptr %local.r
  %t82 = load i64, ptr %local.y.10
  %t83 = call i64 @"sx_f64_mul"(i64 %t81, i64 %t82)
  %t84 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.13)
  %t85 = load i64, ptr %local.y.10
  %t86 = call i64 @"sx_f64_sub"(i64 %t84, i64 %t85)
  %t87 = call i64 @"sx_f64_mul"(i64 %t83, i64 %t86)
  %t88 = load i64, ptr %local.coupling
  %t89 = load i64, ptr %local.x.9
  %t90 = load i64, ptr %local.y.10
  %t91 = call i64 @"sx_f64_sub"(i64 %t89, i64 %t90)
  %t92 = call i64 @"sx_f64_mul"(i64 %t88, i64 %t91)
  %t93 = call i64 @"sx_f64_add"(i64 %t87, i64 %t92)
  store i64 %t93, ptr %local.ynew.18
  %t94 = load i64, ptr %local.xnew.17
  store i64 %t94, ptr %local.x.9
  %t95 = load i64, ptr %local.ynew.18
  store i64 %t95, ptr %local.y.10
  %t96 = load i64, ptr %local.sum_dx.12
  %t97 = load i64, ptr %local.x.9
  %t98 = load i64, ptr %local.prev_x.14
  %t99 = call i64 @"sx_f64_sub"(i64 %t97, i64 %t98)
  %t100 = call i64 @"abs_f64"(i64 %t99)
  %t101 = call i64 @"sx_f64_add"(i64 %t96, i64 %t100)
  store i64 %t101, ptr %local.sum_dx.12
  %t102 = load i64, ptr %local.sum_dy.13
  %t103 = load i64, ptr %local.y.10
  %t104 = load i64, ptr %local.prev_y.15
  %t105 = call i64 @"sx_f64_sub"(i64 %t103, i64 %t104)
  %t106 = call i64 @"abs_f64"(i64 %t105)
  %t107 = call i64 @"sx_f64_add"(i64 %t102, i64 %t106)
  store i64 %t107, ptr %local.sum_dy.13
  %t108 = load i64, ptr %local.x.9
  store i64 %t108, ptr %local.prev_x.14
  %t109 = load i64, ptr %local.y.10
  store i64 %t109, ptr %local.prev_y.15
  %t110 = load i64, ptr %local.count.16
  %t111 = add i64 %t110, 1
  store i64 %t111, ptr %local.count.16
  %t112 = load i64, ptr %local.step.11
  %t113 = add i64 %t112, 1
  store i64 %t113, ptr %local.step.11
  br label %loop2
endloop2:
  %t114 = load i64, ptr %local.sum_dx.12
  %t115 = load i64, ptr %local.sum_dy.13
  %t116 = call i64 @"sx_f64_add"(i64 %t114, i64 %t115)
  %t117 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.14)
  %t118 = load i64, ptr %local.count.16
  %t119 = call i64 @"sx_int_to_f64"(i64 %t118)
  %t120 = call i64 @"sx_f64_mul"(i64 %t117, i64 %t119)
  %t121 = call i64 @"sx_f64_div"(i64 %t116, i64 %t120)
  ret i64 %t121
}

define i64 @"coupled_S"(i64 %r, i64 %coupling) nounwind {
entry:
  %local.x.122 = alloca i64
  %local.y.123 = alloca i64
  %local.step.124 = alloca i64
  %local.early_drift.125 = alloca i64
  %local.late_drift.126 = alloca i64
  %local.count_e.127 = alloca i64
  %local.count_l.128 = alloca i64
  %local.prev_x.129 = alloca i64
  %local.xnew.130 = alloca i64
  %local.ynew.131 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %t132 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.15)
  store i64 %t132, ptr %local.x.122
  %t133 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.16)
  store i64 %t133, ptr %local.y.123
  store i64 0, ptr %local.step.124
  %t134 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.17)
  store i64 %t134, ptr %local.early_drift.125
  %t135 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.18)
  store i64 %t135, ptr %local.late_drift.126
  store i64 0, ptr %local.count_e.127
  store i64 0, ptr %local.count_l.128
  %t136 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.19)
  store i64 %t136, ptr %local.prev_x.129
  %t137 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.20)
  store i64 %t137, ptr %local.xnew.130
  %t138 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.21)
  store i64 %t138, ptr %local.ynew.131
  br label %loop3
loop3:
  %t139 = load i64, ptr %local.step.124
  %t140 = icmp slt i64 %t139, 2000
  %t141 = zext i1 %t140 to i64
  %t142 = icmp ne i64 %t141, 0
  br i1 %t142, label %body3, label %endloop3
body3:
  %t143 = load i64, ptr %local.r
  %t144 = load i64, ptr %local.x.122
  %t145 = call i64 @"sx_f64_mul"(i64 %t143, i64 %t144)
  %t146 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.22)
  %t147 = load i64, ptr %local.x.122
  %t148 = call i64 @"sx_f64_sub"(i64 %t146, i64 %t147)
  %t149 = call i64 @"sx_f64_mul"(i64 %t145, i64 %t148)
  %t150 = load i64, ptr %local.coupling
  %t151 = load i64, ptr %local.y.123
  %t152 = load i64, ptr %local.x.122
  %t153 = call i64 @"sx_f64_sub"(i64 %t151, i64 %t152)
  %t154 = call i64 @"sx_f64_mul"(i64 %t150, i64 %t153)
  %t155 = call i64 @"sx_f64_add"(i64 %t149, i64 %t154)
  store i64 %t155, ptr %local.xnew.130
  %t156 = load i64, ptr %local.r
  %t157 = load i64, ptr %local.y.123
  %t158 = call i64 @"sx_f64_mul"(i64 %t156, i64 %t157)
  %t159 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.23)
  %t160 = load i64, ptr %local.y.123
  %t161 = call i64 @"sx_f64_sub"(i64 %t159, i64 %t160)
  %t162 = call i64 @"sx_f64_mul"(i64 %t158, i64 %t161)
  %t163 = load i64, ptr %local.coupling
  %t164 = load i64, ptr %local.x.122
  %t165 = load i64, ptr %local.y.123
  %t166 = call i64 @"sx_f64_sub"(i64 %t164, i64 %t165)
  %t167 = call i64 @"sx_f64_mul"(i64 %t163, i64 %t166)
  %t168 = call i64 @"sx_f64_add"(i64 %t162, i64 %t167)
  store i64 %t168, ptr %local.ynew.131
  %t169 = load i64, ptr %local.xnew.130
  store i64 %t169, ptr %local.x.122
  %t170 = load i64, ptr %local.ynew.131
  store i64 %t170, ptr %local.y.123
  %t171 = load i64, ptr %local.step.124
  %t172 = icmp sgt i64 %t171, 100
  %t173 = zext i1 %t172 to i64
  %t174 = icmp ne i64 %t173, 0
  br i1 %t174, label %then4, label %else4
then4:
  %t175 = load i64, ptr %local.step.124
  %t176 = icmp slt i64 %t175, 600
  %t177 = zext i1 %t176 to i64
  %t178 = icmp ne i64 %t177, 0
  br i1 %t178, label %then5, label %else5
then5:
  %t179 = load i64, ptr %local.early_drift.125
  %t180 = load i64, ptr %local.x.122
  %t181 = load i64, ptr %local.prev_x.129
  %t182 = call i64 @"sx_f64_sub"(i64 %t180, i64 %t181)
  %t183 = call i64 @"abs_f64"(i64 %t182)
  %t184 = call i64 @"sx_f64_add"(i64 %t179, i64 %t183)
  store i64 %t184, ptr %local.early_drift.125
  %t185 = load i64, ptr %local.count_e.127
  %t186 = add i64 %t185, 1
  store i64 %t186, ptr %local.count_e.127
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t187 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t188 = load i64, ptr %local.step.124
  %t189 = icmp sgt i64 %t188, 1500
  %t190 = zext i1 %t189 to i64
  %t191 = icmp ne i64 %t190, 0
  br i1 %t191, label %then6, label %else6
then6:
  %t192 = load i64, ptr %local.late_drift.126
  %t193 = load i64, ptr %local.x.122
  %t194 = load i64, ptr %local.prev_x.129
  %t195 = call i64 @"sx_f64_sub"(i64 %t193, i64 %t194)
  %t196 = call i64 @"abs_f64"(i64 %t195)
  %t197 = call i64 @"sx_f64_add"(i64 %t192, i64 %t196)
  store i64 %t197, ptr %local.late_drift.126
  %t198 = load i64, ptr %local.count_l.128
  %t199 = add i64 %t198, 1
  store i64 %t199, ptr %local.count_l.128
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t200 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t201 = phi i64 [ %t200, %then4_end ], [ 0, %else4_end ]
  %t202 = load i64, ptr %local.x.122
  store i64 %t202, ptr %local.prev_x.129
  %t203 = load i64, ptr %local.step.124
  %t204 = add i64 %t203, 1
  store i64 %t204, ptr %local.step.124
  br label %loop3
endloop3:
  %t205 = load i64, ptr %local.count_e.127
  %t206 = icmp sgt i64 %t205, 0
  %t207 = zext i1 %t206 to i64
  %t208 = icmp ne i64 %t207, 0
  br i1 %t208, label %then7, label %else7
then7:
  %t209 = load i64, ptr %local.early_drift.125
  %t210 = load i64, ptr %local.count_e.127
  %t211 = call i64 @"sx_int_to_f64"(i64 %t210)
  %t212 = call i64 @"sx_f64_div"(i64 %t209, i64 %t211)
  store i64 %t212, ptr %local.early_drift.125
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t213 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t214 = load i64, ptr %local.count_l.128
  %t215 = icmp sgt i64 %t214, 0
  %t216 = zext i1 %t215 to i64
  %t217 = icmp ne i64 %t216, 0
  br i1 %t217, label %then8, label %else8
then8:
  %t218 = load i64, ptr %local.late_drift.126
  %t219 = load i64, ptr %local.count_l.128
  %t220 = call i64 @"sx_int_to_f64"(i64 %t219)
  %t221 = call i64 @"sx_f64_div"(i64 %t218, i64 %t220)
  store i64 %t221, ptr %local.late_drift.126
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t222 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t223 = load i64, ptr %local.early_drift.125
  %t224 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.24)
  %t225 = call i64 @"sx_f64_gt"(i64 %t223, i64 %t224)
  %t226 = icmp ne i64 %t225, 0
  br i1 %t226, label %then9, label %else9
then9:
  %t227 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.25)
  %t228 = load i64, ptr %local.late_drift.126
  %t229 = load i64, ptr %local.early_drift.125
  %t230 = call i64 @"sx_f64_div"(i64 %t228, i64 %t229)
  %t231 = call i64 @"sx_f64_sub"(i64 %t227, i64 %t230)
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t232 = load i64, ptr %local.late_drift.126
  %t233 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.26)
  %t234 = call i64 @"sx_f64_lt"(i64 %t232, i64 %t233)
  %t235 = icmp ne i64 %t234, 0
  br i1 %t235, label %then10, label %else10
then10:
  %t236 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.27)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t237 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.28)
  %t238 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.29)
  %t239 = call i64 @"sx_f64_sub"(i64 %t237, i64 %t238)
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t240 = phi i64 [ %t236, %then10_end ], [ %t239, %else10_end ]
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t241 = phi i64 [ %t231, %then9_end ], [ %t240, %else9_end ]
  ret i64 %t241
}

define i64 @"test_coupled_maps"() nounwind {
entry:
  %local.c.242 = alloca i64
  %local.sweep.243 = alloca i64
  %local.s.244 = alloca i64
  %local.d.245 = alloca i64
  %t246 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.30)
  %t247 = ptrtoint ptr %t246 to i64
  %t248 = inttoptr i64 %t247 to ptr
  call void @intrinsic_println(ptr %t248)
  %t249 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.31)
  %t250 = ptrtoint ptr %t249 to i64
  %t251 = inttoptr i64 %t250 to ptr
  call void @intrinsic_println(ptr %t251)
  %t252 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.32)
  %t253 = ptrtoint ptr %t252 to i64
  %t254 = inttoptr i64 %t253 to ptr
  call void @intrinsic_println(ptr %t254)
  %t255 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.33)
  %t256 = ptrtoint ptr %t255 to i64
  %t257 = inttoptr i64 %t256 to ptr
  call void @intrinsic_println(ptr %t257)
  %t258 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.34)
  %t259 = ptrtoint ptr %t258 to i64
  %t260 = inttoptr i64 %t259 to ptr
  call void @intrinsic_println(ptr %t260)
  %t261 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.35)
  store i64 %t261, ptr %local.c.242
  store i64 0, ptr %local.sweep.243
  br label %loop11
loop11:
  %t262 = load i64, ptr %local.sweep.243
  %t263 = icmp slt i64 %t262, 11
  %t264 = zext i1 %t263 to i64
  %t265 = icmp ne i64 %t264, 0
  br i1 %t265, label %body11, label %endloop11
body11:
  %t266 = load i64, ptr %local.sweep.243
  %t267 = call i64 @"sx_int_to_f64"(i64 %t266)
  %t268 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.36)
  %t269 = call i64 @"sx_f64_mul"(i64 %t267, i64 %t268)
  store i64 %t269, ptr %local.c.242
  %t270 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.37)
  %t271 = load i64, ptr %local.c.242
  %t272 = call i64 @"coupled_S"(i64 %t270, i64 %t271)
  store i64 %t272, ptr %local.s.244
  %t273 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.38)
  %t274 = load i64, ptr %local.c.242
  %t275 = call i64 @"coupled_drift"(i64 %t273, i64 %t274, i64 500)
  store i64 %t275, ptr %local.d.245
  %t276 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.39)
  %t277 = ptrtoint ptr %t276 to i64
  %t278 = inttoptr i64 %t277 to ptr
  call void @intrinsic_print(ptr %t278)
  %t279 = load i64, ptr %local.c.242
  %t280 = call i64 @"print_f64"(i64 %t279)
  %t281 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.40)
  %t282 = ptrtoint ptr %t281 to i64
  %t283 = inttoptr i64 %t282 to ptr
  call void @intrinsic_print(ptr %t283)
  %t284 = load i64, ptr %local.s.244
  %t285 = call i64 @"print_f64"(i64 %t284)
  %t286 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.41)
  %t287 = ptrtoint ptr %t286 to i64
  %t288 = inttoptr i64 %t287 to ptr
  call void @intrinsic_print(ptr %t288)
  %t289 = load i64, ptr %local.d.245
  %t290 = call i64 @"print_f64"(i64 %t289)
  %t291 = load i64, ptr %local.s.244
  %t292 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.42)
  %t293 = call i64 @"sx_f64_gt"(i64 %t291, i64 %t292)
  %t294 = icmp ne i64 %t293, 0
  br i1 %t294, label %then12, label %else12
then12:
  %t295 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.43)
  %t296 = ptrtoint ptr %t295 to i64
  %t297 = inttoptr i64 %t296 to ptr
  call void @intrinsic_println(ptr %t297)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  %t298 = load i64, ptr %local.s.244
  %t299 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.44)
  %t300 = call i64 @"sx_f64_gt"(i64 %t298, i64 %t299)
  %t301 = icmp ne i64 %t300, 0
  br i1 %t301, label %then13, label %else13
then13:
  %t302 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.45)
  %t303 = ptrtoint ptr %t302 to i64
  %t304 = inttoptr i64 %t303 to ptr
  call void @intrinsic_println(ptr %t304)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  %t305 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.46)
  %t306 = ptrtoint ptr %t305 to i64
  %t307 = inttoptr i64 %t306 to ptr
  call void @intrinsic_println(ptr %t307)
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t308 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t309 = phi i64 [ 0, %then12_end ], [ %t308, %else12_end ]
  %t310 = load i64, ptr %local.sweep.243
  %t311 = add i64 %t310, 1
  store i64 %t311, ptr %local.sweep.243
  br label %loop11
endloop11:
  %t312 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.47)
  %t313 = ptrtoint ptr %t312 to i64
  %t314 = inttoptr i64 %t313 to ptr
  call void @intrinsic_println(ptr %t314)
  %t315 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.48)
  %t316 = ptrtoint ptr %t315 to i64
  %t317 = inttoptr i64 %t316 to ptr
  call void @intrinsic_println(ptr %t317)
  %t318 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.49)
  %t319 = ptrtoint ptr %t318 to i64
  %t320 = inttoptr i64 %t319 to ptr
  call void @intrinsic_println(ptr %t320)
  %t321 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.50)
  %t322 = ptrtoint ptr %t321 to i64
  %t323 = inttoptr i64 %t322 to ptr
  call void @intrinsic_println(ptr %t323)
  ret i64 0
}

define i64 @"logistic_S_window"(i64 %r, i64 %window) nounwind {
entry:
  %local.x.324 = alloca i64
  %local.step.325 = alloca i64
  %local.early_d.326 = alloca i64
  %local.late_d.327 = alloca i64
  %local.prev_x.328 = alloca i64
  %local.count_e.329 = alloca i64
  %local.count_l.330 = alloca i64
  %local.total.331 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.window = alloca i64
  store i64 %window, ptr %local.window
  %t332 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.51)
  store i64 %t332, ptr %local.x.324
  store i64 0, ptr %local.step.325
  %t333 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.52)
  store i64 %t333, ptr %local.early_d.326
  %t334 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.53)
  store i64 %t334, ptr %local.late_d.327
  %t335 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.54)
  store i64 %t335, ptr %local.prev_x.328
  store i64 0, ptr %local.count_e.329
  store i64 0, ptr %local.count_l.330
  %t336 = load i64, ptr %local.window
  %t337 = mul i64 2, %t336
  %t338 = add i64 500, %t337
  store i64 %t338, ptr %local.total.331
  br label %loop14
loop14:
  %t339 = load i64, ptr %local.step.325
  %t340 = load i64, ptr %local.total.331
  %t341 = icmp slt i64 %t339, %t340
  %t342 = zext i1 %t341 to i64
  %t343 = icmp ne i64 %t342, 0
  br i1 %t343, label %body14, label %endloop14
body14:
  %t344 = load i64, ptr %local.r
  %t345 = load i64, ptr %local.x.324
  %t346 = call i64 @"sx_f64_mul"(i64 %t344, i64 %t345)
  %t347 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.55)
  %t348 = load i64, ptr %local.x.324
  %t349 = call i64 @"sx_f64_sub"(i64 %t347, i64 %t348)
  %t350 = call i64 @"sx_f64_mul"(i64 %t346, i64 %t349)
  store i64 %t350, ptr %local.x.324
  %t351 = load i64, ptr %local.step.325
  %t352 = icmp sge i64 %t351, 500
  %t353 = zext i1 %t352 to i64
  %t354 = icmp ne i64 %t353, 0
  br i1 %t354, label %then15, label %else15
then15:
  %t355 = load i64, ptr %local.step.325
  %t356 = load i64, ptr %local.window
  %t357 = add i64 500, %t356
  %t358 = icmp slt i64 %t355, %t357
  %t359 = zext i1 %t358 to i64
  %t360 = icmp ne i64 %t359, 0
  br i1 %t360, label %then16, label %else16
then16:
  %t361 = load i64, ptr %local.early_d.326
  %t362 = load i64, ptr %local.x.324
  %t363 = load i64, ptr %local.prev_x.328
  %t364 = call i64 @"sx_f64_sub"(i64 %t362, i64 %t363)
  %t365 = call i64 @"abs_f64"(i64 %t364)
  %t366 = call i64 @"sx_f64_add"(i64 %t361, i64 %t365)
  store i64 %t366, ptr %local.early_d.326
  %t367 = load i64, ptr %local.count_e.329
  %t368 = add i64 %t367, 1
  store i64 %t368, ptr %local.count_e.329
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t369 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t370 = load i64, ptr %local.step.325
  %t371 = load i64, ptr %local.window
  %t372 = add i64 500, %t371
  %t373 = icmp sge i64 %t370, %t372
  %t374 = zext i1 %t373 to i64
  %t375 = icmp ne i64 %t374, 0
  br i1 %t375, label %then17, label %else17
then17:
  %t376 = load i64, ptr %local.late_d.327
  %t377 = load i64, ptr %local.x.324
  %t378 = load i64, ptr %local.prev_x.328
  %t379 = call i64 @"sx_f64_sub"(i64 %t377, i64 %t378)
  %t380 = call i64 @"abs_f64"(i64 %t379)
  %t381 = call i64 @"sx_f64_add"(i64 %t376, i64 %t380)
  store i64 %t381, ptr %local.late_d.327
  %t382 = load i64, ptr %local.count_l.330
  %t383 = add i64 %t382, 1
  store i64 %t383, ptr %local.count_l.330
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t384 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t385 = phi i64 [ %t384, %then15_end ], [ 0, %else15_end ]
  %t386 = load i64, ptr %local.x.324
  store i64 %t386, ptr %local.prev_x.328
  %t387 = load i64, ptr %local.step.325
  %t388 = add i64 %t387, 1
  store i64 %t388, ptr %local.step.325
  br label %loop14
endloop14:
  %t389 = load i64, ptr %local.count_e.329
  %t390 = icmp sgt i64 %t389, 0
  %t391 = zext i1 %t390 to i64
  %t392 = icmp ne i64 %t391, 0
  br i1 %t392, label %then18, label %else18
then18:
  %t393 = load i64, ptr %local.early_d.326
  %t394 = load i64, ptr %local.count_e.329
  %t395 = call i64 @"sx_int_to_f64"(i64 %t394)
  %t396 = call i64 @"sx_f64_div"(i64 %t393, i64 %t395)
  store i64 %t396, ptr %local.early_d.326
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t397 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t398 = load i64, ptr %local.count_l.330
  %t399 = icmp sgt i64 %t398, 0
  %t400 = zext i1 %t399 to i64
  %t401 = icmp ne i64 %t400, 0
  br i1 %t401, label %then19, label %else19
then19:
  %t402 = load i64, ptr %local.late_d.327
  %t403 = load i64, ptr %local.count_l.330
  %t404 = call i64 @"sx_int_to_f64"(i64 %t403)
  %t405 = call i64 @"sx_f64_div"(i64 %t402, i64 %t404)
  store i64 %t405, ptr %local.late_d.327
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t406 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t407 = load i64, ptr %local.early_d.326
  %t408 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.56)
  %t409 = call i64 @"sx_f64_gt"(i64 %t407, i64 %t408)
  %t410 = icmp ne i64 %t409, 0
  br i1 %t410, label %then20, label %else20
then20:
  %t411 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.57)
  %t412 = load i64, ptr %local.late_d.327
  %t413 = load i64, ptr %local.early_d.326
  %t414 = call i64 @"sx_f64_div"(i64 %t412, i64 %t413)
  %t415 = call i64 @"sx_f64_sub"(i64 %t411, i64 %t414)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  %t416 = load i64, ptr %local.late_d.327
  %t417 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.58)
  %t418 = call i64 @"sx_f64_lt"(i64 %t416, i64 %t417)
  %t419 = icmp ne i64 %t418, 0
  br i1 %t419, label %then21, label %else21
then21:
  %t420 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.59)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t421 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.60)
  %t422 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.61)
  %t423 = call i64 @"sx_f64_sub"(i64 %t421, i64 %t422)
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t424 = phi i64 [ %t420, %then21_end ], [ %t423, %else21_end ]
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t425 = phi i64 [ %t415, %then20_end ], [ %t424, %else20_end ]
  ret i64 %t425
}

define i64 @"test_s_spectrum"() nounwind {
entry:
  %local.r.426 = alloca i64
  %local.s10.427 = alloca i64
  %local.s50.428 = alloca i64
  %local.s200.429 = alloca i64
  %local.s500.430 = alloca i64
  %t431 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.62)
  %t432 = ptrtoint ptr %t431 to i64
  %t433 = inttoptr i64 %t432 to ptr
  call void @intrinsic_println(ptr %t433)
  %t434 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.63)
  %t435 = ptrtoint ptr %t434 to i64
  %t436 = inttoptr i64 %t435 to ptr
  call void @intrinsic_println(ptr %t436)
  %t437 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.64)
  %t438 = ptrtoint ptr %t437 to i64
  %t439 = inttoptr i64 %t438 to ptr
  call void @intrinsic_println(ptr %t439)
  %t440 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.65)
  %t441 = ptrtoint ptr %t440 to i64
  %t442 = inttoptr i64 %t441 to ptr
  call void @intrinsic_println(ptr %t442)
  %t443 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.66)
  %t444 = ptrtoint ptr %t443 to i64
  %t445 = inttoptr i64 %t444 to ptr
  call void @intrinsic_println(ptr %t445)
  %t446 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.67)
  store i64 %t446, ptr %local.r.426
  br label %loop22
loop22:
  %t447 = load i64, ptr %local.r.426
  %t448 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.68)
  %t449 = call i64 @"sx_f64_lt"(i64 %t447, i64 %t448)
  %t450 = icmp ne i64 %t449, 0
  br i1 %t450, label %body22, label %endloop22
body22:
  %t451 = load i64, ptr %local.r.426
  %t452 = call i64 @"logistic_S_window"(i64 %t451, i64 10)
  store i64 %t452, ptr %local.s10.427
  %t453 = load i64, ptr %local.r.426
  %t454 = call i64 @"logistic_S_window"(i64 %t453, i64 50)
  store i64 %t454, ptr %local.s50.428
  %t455 = load i64, ptr %local.r.426
  %t456 = call i64 @"logistic_S_window"(i64 %t455, i64 200)
  store i64 %t456, ptr %local.s200.429
  %t457 = load i64, ptr %local.r.426
  %t458 = call i64 @"logistic_S_window"(i64 %t457, i64 500)
  store i64 %t458, ptr %local.s500.430
  %t459 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.69)
  %t460 = ptrtoint ptr %t459 to i64
  %t461 = inttoptr i64 %t460 to ptr
  call void @intrinsic_print(ptr %t461)
  %t462 = load i64, ptr %local.r.426
  %t463 = call i64 @"print_f64"(i64 %t462)
  %t464 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.70)
  %t465 = ptrtoint ptr %t464 to i64
  %t466 = inttoptr i64 %t465 to ptr
  call void @intrinsic_print(ptr %t466)
  %t467 = load i64, ptr %local.s10.427
  %t468 = call i64 @"print_f64"(i64 %t467)
  %t469 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.71)
  %t470 = ptrtoint ptr %t469 to i64
  %t471 = inttoptr i64 %t470 to ptr
  call void @intrinsic_print(ptr %t471)
  %t472 = load i64, ptr %local.s50.428
  %t473 = call i64 @"print_f64"(i64 %t472)
  %t474 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.72)
  %t475 = ptrtoint ptr %t474 to i64
  %t476 = inttoptr i64 %t475 to ptr
  call void @intrinsic_print(ptr %t476)
  %t477 = load i64, ptr %local.s200.429
  %t478 = call i64 @"print_f64"(i64 %t477)
  %t479 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.73)
  %t480 = ptrtoint ptr %t479 to i64
  %t481 = inttoptr i64 %t480 to ptr
  call void @intrinsic_print(ptr %t481)
  %t482 = load i64, ptr %local.s500.430
  %t483 = call i64 @"print_f64"(i64 %t482)
  %t484 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.74)
  %t485 = ptrtoint ptr %t484 to i64
  %t486 = inttoptr i64 %t485 to ptr
  call void @intrinsic_println(ptr %t486)
  %t487 = load i64, ptr %local.r.426
  %t488 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.75)
  %t489 = call i64 @"sx_f64_add"(i64 %t487, i64 %t488)
  store i64 %t489, ptr %local.r.426
  br label %loop22
endloop22:
  %t490 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.76)
  %t491 = ptrtoint ptr %t490 to i64
  %t492 = inttoptr i64 %t491 to ptr
  call void @intrinsic_println(ptr %t492)
  %t493 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.77)
  %t494 = ptrtoint ptr %t493 to i64
  %t495 = inttoptr i64 %t494 to ptr
  call void @intrinsic_println(ptr %t495)
  %t496 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.78)
  %t497 = ptrtoint ptr %t496 to i64
  %t498 = inttoptr i64 %t497 to ptr
  call void @intrinsic_println(ptr %t498)
  %t499 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.79)
  %t500 = ptrtoint ptr %t499 to i64
  %t501 = inttoptr i64 %t500 to ptr
  call void @intrinsic_println(ptr %t501)
  ret i64 0
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t502 = load i64, ptr %local.state
  %t503 = mul i64 %t502, 1664525
  %t504 = add i64 %t503, 1013904223
  ret i64 %t504
}

define i64 @"lcg_gauss"(i64 %state) nounwind {
entry:
  %local.s.505 = alloca i64
  %local.sum.506 = alloca i64
  %local.i.507 = alloca i64
  %local.v.508 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t509 = load i64, ptr %local.state
  store i64 %t509, ptr %local.s.505
  %t510 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.80)
  store i64 %t510, ptr %local.sum.506
  store i64 0, ptr %local.i.507
  br label %loop23
loop23:
  %t511 = load i64, ptr %local.i.507
  %t512 = icmp slt i64 %t511, 6
  %t513 = zext i1 %t512 to i64
  %t514 = icmp ne i64 %t513, 0
  br i1 %t514, label %body23, label %endloop23
body23:
  %t515 = load i64, ptr %local.s.505
  %t516 = call i64 @"lcg_next"(i64 %t515)
  store i64 %t516, ptr %local.s.505
  %t517 = load i64, ptr %local.s.505
  store i64 %t517, ptr %local.v.508
  %t518 = load i64, ptr %local.v.508
  %t519 = icmp slt i64 %t518, 0
  %t520 = zext i1 %t519 to i64
  %t521 = icmp ne i64 %t520, 0
  br i1 %t521, label %then24, label %else24
then24:
  %t522 = load i64, ptr %local.v.508
  %t523 = sub i64 0, %t522
  store i64 %t523, ptr %local.v.508
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t524 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t525 = load i64, ptr %local.sum.506
  %t526 = load i64, ptr %local.v.508
  %t527 = srem i64 %t526, 10000
  %t528 = call i64 @"sx_int_to_f64"(i64 %t527)
  %t529 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.81)
  %t530 = call i64 @"sx_f64_div"(i64 %t528, i64 %t529)
  %t531 = call i64 @"sx_f64_add"(i64 %t525, i64 %t530)
  store i64 %t531, ptr %local.sum.506
  %t532 = load i64, ptr %local.i.507
  %t533 = add i64 %t532, 1
  store i64 %t533, ptr %local.i.507
  br label %loop23
endloop23:
  %t534 = load i64, ptr %local.sum.506
  %t535 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.82)
  %t536 = call i64 @"sx_f64_sub"(i64 %t534, i64 %t535)
  ret i64 %t536
}

define i64 @"noisy_S"(i64 %r, i64 %noise_level, i64 %seed) nounwind {
entry:
  %local.x.537 = alloca i64
  %local.rng.538 = alloca i64
  %local.step.539 = alloca i64
  %local.early_d.540 = alloca i64
  %local.late_d.541 = alloca i64
  %local.prev_obs.542 = alloca i64
  %local.obs.543 = alloca i64
  %local.count_e.544 = alloca i64
  %local.count_l.545 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.noise_level = alloca i64
  store i64 %noise_level, ptr %local.noise_level
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t546 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.83)
  store i64 %t546, ptr %local.x.537
  %t547 = load i64, ptr %local.seed
  store i64 %t547, ptr %local.rng.538
  store i64 0, ptr %local.step.539
  %t548 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.84)
  store i64 %t548, ptr %local.early_d.540
  %t549 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.85)
  store i64 %t549, ptr %local.late_d.541
  %t550 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.86)
  store i64 %t550, ptr %local.prev_obs.542
  %t551 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.87)
  store i64 %t551, ptr %local.obs.543
  store i64 0, ptr %local.count_e.544
  store i64 0, ptr %local.count_l.545
  br label %loop25
loop25:
  %t552 = load i64, ptr %local.step.539
  %t553 = icmp slt i64 %t552, 2000
  %t554 = zext i1 %t553 to i64
  %t555 = icmp ne i64 %t554, 0
  br i1 %t555, label %body25, label %endloop25
body25:
  %t556 = load i64, ptr %local.r
  %t557 = load i64, ptr %local.x.537
  %t558 = call i64 @"sx_f64_mul"(i64 %t556, i64 %t557)
  %t559 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.88)
  %t560 = load i64, ptr %local.x.537
  %t561 = call i64 @"sx_f64_sub"(i64 %t559, i64 %t560)
  %t562 = call i64 @"sx_f64_mul"(i64 %t558, i64 %t561)
  store i64 %t562, ptr %local.x.537
  %t563 = load i64, ptr %local.rng.538
  %t564 = call i64 @"lcg_next"(i64 %t563)
  store i64 %t564, ptr %local.rng.538
  %t565 = load i64, ptr %local.x.537
  %t566 = load i64, ptr %local.noise_level
  %t567 = load i64, ptr %local.rng.538
  %t568 = call i64 @"lcg_gauss"(i64 %t567)
  %t569 = call i64 @"sx_f64_mul"(i64 %t566, i64 %t568)
  %t570 = call i64 @"sx_f64_add"(i64 %t565, i64 %t569)
  store i64 %t570, ptr %local.obs.543
  %t571 = load i64, ptr %local.step.539
  %t572 = icmp sgt i64 %t571, 200
  %t573 = zext i1 %t572 to i64
  %t574 = icmp ne i64 %t573, 0
  br i1 %t574, label %then26, label %else26
then26:
  %t575 = load i64, ptr %local.step.539
  %t576 = icmp slt i64 %t575, 700
  %t577 = zext i1 %t576 to i64
  %t578 = icmp ne i64 %t577, 0
  br i1 %t578, label %then27, label %else27
then27:
  %t579 = load i64, ptr %local.early_d.540
  %t580 = load i64, ptr %local.obs.543
  %t581 = load i64, ptr %local.prev_obs.542
  %t582 = call i64 @"sx_f64_sub"(i64 %t580, i64 %t581)
  %t583 = call i64 @"abs_f64"(i64 %t582)
  %t584 = call i64 @"sx_f64_add"(i64 %t579, i64 %t583)
  store i64 %t584, ptr %local.early_d.540
  %t585 = load i64, ptr %local.count_e.544
  %t586 = add i64 %t585, 1
  store i64 %t586, ptr %local.count_e.544
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t587 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t588 = load i64, ptr %local.step.539
  %t589 = icmp sgt i64 %t588, 1500
  %t590 = zext i1 %t589 to i64
  %t591 = icmp ne i64 %t590, 0
  br i1 %t591, label %then28, label %else28
then28:
  %t592 = load i64, ptr %local.late_d.541
  %t593 = load i64, ptr %local.obs.543
  %t594 = load i64, ptr %local.prev_obs.542
  %t595 = call i64 @"sx_f64_sub"(i64 %t593, i64 %t594)
  %t596 = call i64 @"abs_f64"(i64 %t595)
  %t597 = call i64 @"sx_f64_add"(i64 %t592, i64 %t596)
  store i64 %t597, ptr %local.late_d.541
  %t598 = load i64, ptr %local.count_l.545
  %t599 = add i64 %t598, 1
  store i64 %t599, ptr %local.count_l.545
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t600 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t601 = phi i64 [ %t600, %then26_end ], [ 0, %else26_end ]
  %t602 = load i64, ptr %local.obs.543
  store i64 %t602, ptr %local.prev_obs.542
  %t603 = load i64, ptr %local.step.539
  %t604 = add i64 %t603, 1
  store i64 %t604, ptr %local.step.539
  br label %loop25
endloop25:
  %t605 = load i64, ptr %local.count_e.544
  %t606 = icmp sgt i64 %t605, 0
  %t607 = zext i1 %t606 to i64
  %t608 = icmp ne i64 %t607, 0
  br i1 %t608, label %then29, label %else29
then29:
  %t609 = load i64, ptr %local.early_d.540
  %t610 = load i64, ptr %local.count_e.544
  %t611 = call i64 @"sx_int_to_f64"(i64 %t610)
  %t612 = call i64 @"sx_f64_div"(i64 %t609, i64 %t611)
  store i64 %t612, ptr %local.early_d.540
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t613 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t614 = load i64, ptr %local.count_l.545
  %t615 = icmp sgt i64 %t614, 0
  %t616 = zext i1 %t615 to i64
  %t617 = icmp ne i64 %t616, 0
  br i1 %t617, label %then30, label %else30
then30:
  %t618 = load i64, ptr %local.late_d.541
  %t619 = load i64, ptr %local.count_l.545
  %t620 = call i64 @"sx_int_to_f64"(i64 %t619)
  %t621 = call i64 @"sx_f64_div"(i64 %t618, i64 %t620)
  store i64 %t621, ptr %local.late_d.541
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t622 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t623 = load i64, ptr %local.early_d.540
  %t624 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.89)
  %t625 = call i64 @"sx_f64_gt"(i64 %t623, i64 %t624)
  %t626 = icmp ne i64 %t625, 0
  br i1 %t626, label %then31, label %else31
then31:
  %t627 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.90)
  %t628 = load i64, ptr %local.late_d.541
  %t629 = load i64, ptr %local.early_d.540
  %t630 = call i64 @"sx_f64_div"(i64 %t628, i64 %t629)
  %t631 = call i64 @"sx_f64_sub"(i64 %t627, i64 %t630)
  br label %then31_end
then31_end:
  br label %endif31
else31:
  %t632 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.91)
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t633 = phi i64 [ %t631, %then31_end ], [ %t632, %else31_end ]
  ret i64 %t633
}

define i64 @"test_noisy"() nounwind {
entry:
  %local.n.634 = alloca i64
  %local.sweep.635 = alloca i64
  %local.s_order.636 = alloca i64
  %local.s_trans.637 = alloca i64
  %local.s_chaos.638 = alloca i64
  %t639 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.92)
  %t640 = ptrtoint ptr %t639 to i64
  %t641 = inttoptr i64 %t640 to ptr
  call void @intrinsic_println(ptr %t641)
  %t642 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.93)
  %t643 = ptrtoint ptr %t642 to i64
  %t644 = inttoptr i64 %t643 to ptr
  call void @intrinsic_println(ptr %t644)
  %t645 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.94)
  %t646 = ptrtoint ptr %t645 to i64
  %t647 = inttoptr i64 %t646 to ptr
  call void @intrinsic_println(ptr %t647)
  %t648 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.95)
  %t649 = ptrtoint ptr %t648 to i64
  %t650 = inttoptr i64 %t649 to ptr
  call void @intrinsic_println(ptr %t650)
  %t651 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.96)
  %t652 = ptrtoint ptr %t651 to i64
  %t653 = inttoptr i64 %t652 to ptr
  call void @intrinsic_println(ptr %t653)
  %t654 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.97)
  store i64 %t654, ptr %local.n.634
  store i64 0, ptr %local.sweep.635
  br label %loop32
loop32:
  %t655 = load i64, ptr %local.sweep.635
  %t656 = icmp slt i64 %t655, 7
  %t657 = zext i1 %t656 to i64
  %t658 = icmp ne i64 %t657, 0
  br i1 %t658, label %body32, label %endloop32
body32:
  %t659 = load i64, ptr %local.sweep.635
  %t660 = call i64 @"sx_int_to_f64"(i64 %t659)
  %t661 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.98)
  %t662 = call i64 @"sx_f64_mul"(i64 %t660, i64 %t661)
  store i64 %t662, ptr %local.n.634
  %t663 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.99)
  %t664 = load i64, ptr %local.n.634
  %t665 = call i64 @"noisy_S"(i64 %t663, i64 %t664, i64 42)
  store i64 %t665, ptr %local.s_order.636
  %t666 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.100)
  %t667 = load i64, ptr %local.n.634
  %t668 = call i64 @"noisy_S"(i64 %t666, i64 %t667, i64 42)
  store i64 %t668, ptr %local.s_trans.637
  %t669 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.101)
  %t670 = load i64, ptr %local.n.634
  %t671 = call i64 @"noisy_S"(i64 %t669, i64 %t670, i64 42)
  store i64 %t671, ptr %local.s_chaos.638
  %t672 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.102)
  %t673 = ptrtoint ptr %t672 to i64
  %t674 = inttoptr i64 %t673 to ptr
  call void @intrinsic_print(ptr %t674)
  %t675 = load i64, ptr %local.n.634
  %t676 = call i64 @"print_f64"(i64 %t675)
  %t677 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.103)
  %t678 = ptrtoint ptr %t677 to i64
  %t679 = inttoptr i64 %t678 to ptr
  call void @intrinsic_print(ptr %t679)
  %t680 = load i64, ptr %local.s_order.636
  %t681 = call i64 @"print_f64"(i64 %t680)
  %t682 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.104)
  %t683 = ptrtoint ptr %t682 to i64
  %t684 = inttoptr i64 %t683 to ptr
  call void @intrinsic_print(ptr %t684)
  %t685 = load i64, ptr %local.s_trans.637
  %t686 = call i64 @"print_f64"(i64 %t685)
  %t687 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.105)
  %t688 = ptrtoint ptr %t687 to i64
  %t689 = inttoptr i64 %t688 to ptr
  call void @intrinsic_print(ptr %t689)
  %t690 = load i64, ptr %local.s_chaos.638
  %t691 = call i64 @"print_f64"(i64 %t690)
  %t692 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.106)
  %t693 = ptrtoint ptr %t692 to i64
  %t694 = inttoptr i64 %t693 to ptr
  call void @intrinsic_println(ptr %t694)
  %t695 = load i64, ptr %local.sweep.635
  %t696 = add i64 %t695, 1
  store i64 %t696, ptr %local.sweep.635
  br label %loop32
endloop32:
  %t697 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.107)
  %t698 = ptrtoint ptr %t697 to i64
  %t699 = inttoptr i64 %t698 to ptr
  call void @intrinsic_println(ptr %t699)
  %t700 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.108)
  %t701 = ptrtoint ptr %t700 to i64
  %t702 = inttoptr i64 %t701 to ptr
  call void @intrinsic_println(ptr %t702)
  %t703 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.109)
  %t704 = ptrtoint ptr %t703 to i64
  %t705 = inttoptr i64 %t704 to ptr
  call void @intrinsic_println(ptr %t705)
  %t706 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.110)
  %t707 = ptrtoint ptr %t706 to i64
  %t708 = inttoptr i64 %t707 to ptr
  call void @intrinsic_println(ptr %t708)
  ret i64 0
}

define i64 @"test_regime_change"() nounwind {
entry:
  %local.x.709 = alloca i64
  %local.step.710 = alloca i64
  %local.prev_x.711 = alloca i64
  %local.r.712 = alloca i64
  %local.window_sum.713 = alloca i64
  %local.window_count.714 = alloca i64
  %local.prev_window_avg.715 = alloca i64
  %local.window_avg.716 = alloca i64
  %local.s_local.717 = alloca i64
  %t718 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.111)
  %t719 = ptrtoint ptr %t718 to i64
  %t720 = inttoptr i64 %t719 to ptr
  call void @intrinsic_println(ptr %t720)
  %t721 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.112)
  %t722 = ptrtoint ptr %t721 to i64
  %t723 = inttoptr i64 %t722 to ptr
  call void @intrinsic_println(ptr %t723)
  %t724 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.113)
  %t725 = ptrtoint ptr %t724 to i64
  %t726 = inttoptr i64 %t725 to ptr
  call void @intrinsic_println(ptr %t726)
  %t727 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.114)
  %t728 = ptrtoint ptr %t727 to i64
  %t729 = inttoptr i64 %t728 to ptr
  call void @intrinsic_println(ptr %t729)
  %t730 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.115)
  store i64 %t730, ptr %local.x.709
  store i64 0, ptr %local.step.710
  %t731 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.116)
  store i64 %t731, ptr %local.prev_x.711
  %t732 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.117)
  store i64 %t732, ptr %local.r.712
  %t733 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.118)
  store i64 %t733, ptr %local.window_sum.713
  store i64 0, ptr %local.window_count.714
  %t734 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.119)
  store i64 %t734, ptr %local.prev_window_avg.715
  %t735 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.120)
  store i64 %t735, ptr %local.window_avg.716
  %t736 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.121)
  store i64 %t736, ptr %local.s_local.717
  %t737 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.122)
  %t738 = ptrtoint ptr %t737 to i64
  %t739 = inttoptr i64 %t738 to ptr
  call void @intrinsic_println(ptr %t739)
  br label %loop33
loop33:
  %t740 = load i64, ptr %local.step.710
  %t741 = icmp slt i64 %t740, 2000
  %t742 = zext i1 %t741 to i64
  %t743 = icmp ne i64 %t742, 0
  br i1 %t743, label %body33, label %endloop33
body33:
  %t744 = load i64, ptr %local.step.710
  %t745 = icmp sge i64 %t744, 1000
  %t746 = zext i1 %t745 to i64
  %t747 = icmp ne i64 %t746, 0
  br i1 %t747, label %then34, label %else34
then34:
  %t748 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.123)
  store i64 %t748, ptr %local.r.712
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t749 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t750 = load i64, ptr %local.r.712
  %t751 = load i64, ptr %local.x.709
  %t752 = call i64 @"sx_f64_mul"(i64 %t750, i64 %t751)
  %t753 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.124)
  %t754 = load i64, ptr %local.x.709
  %t755 = call i64 @"sx_f64_sub"(i64 %t753, i64 %t754)
  %t756 = call i64 @"sx_f64_mul"(i64 %t752, i64 %t755)
  store i64 %t756, ptr %local.x.709
  %t757 = load i64, ptr %local.window_sum.713
  %t758 = load i64, ptr %local.x.709
  %t759 = load i64, ptr %local.prev_x.711
  %t760 = call i64 @"sx_f64_sub"(i64 %t758, i64 %t759)
  %t761 = call i64 @"abs_f64"(i64 %t760)
  %t762 = call i64 @"sx_f64_add"(i64 %t757, i64 %t761)
  store i64 %t762, ptr %local.window_sum.713
  %t763 = load i64, ptr %local.window_count.714
  %t764 = add i64 %t763, 1
  store i64 %t764, ptr %local.window_count.714
  %t765 = load i64, ptr %local.window_count.714
  %t766 = icmp sge i64 %t765, 100
  %t767 = zext i1 %t766 to i64
  %t768 = icmp ne i64 %t767, 0
  br i1 %t768, label %then35, label %else35
then35:
  %t769 = load i64, ptr %local.window_sum.713
  %t770 = load i64, ptr %local.window_count.714
  %t771 = call i64 @"sx_int_to_f64"(i64 %t770)
  %t772 = call i64 @"sx_f64_div"(i64 %t769, i64 %t771)
  store i64 %t772, ptr %local.window_avg.716
  %t773 = load i64, ptr %local.prev_window_avg.715
  %t774 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.125)
  %t775 = call i64 @"sx_f64_gt"(i64 %t773, i64 %t774)
  %t776 = icmp ne i64 %t775, 0
  br i1 %t776, label %then36, label %else36
then36:
  %t777 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.126)
  %t778 = load i64, ptr %local.window_avg.716
  %t779 = load i64, ptr %local.prev_window_avg.715
  %t780 = call i64 @"sx_f64_div"(i64 %t778, i64 %t779)
  %t781 = call i64 @"sx_f64_sub"(i64 %t777, i64 %t780)
  store i64 %t781, ptr %local.s_local.717
  br label %then36_end
then36_end:
  br label %endif36
else36:
  %t782 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.127)
  store i64 %t782, ptr %local.s_local.717
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t783 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t784 = load i64, ptr %local.step.710
  %t785 = icmp eq i64 %t784, 500
  %t786 = zext i1 %t785 to i64
  %t787 = icmp ne i64 %t786, 0
  br i1 %t787, label %then37, label %else37
then37:
  %t788 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.128)
  %t789 = ptrtoint ptr %t788 to i64
  %t790 = inttoptr i64 %t789 to ptr
  call void @intrinsic_print(ptr %t790)
  %t791 = load i64, ptr %local.window_avg.716
  %t792 = call i64 @"print_f64"(i64 %t791)
  %t793 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.129)
  %t794 = ptrtoint ptr %t793 to i64
  %t795 = inttoptr i64 %t794 to ptr
  call void @intrinsic_print(ptr %t795)
  %t796 = load i64, ptr %local.s_local.717
  %t797 = call i64 @"print_f64"(i64 %t796)
  %t798 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.130)
  %t799 = ptrtoint ptr %t798 to i64
  %t800 = inttoptr i64 %t799 to ptr
  call void @intrinsic_println(ptr %t800)
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t801 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t802 = load i64, ptr %local.step.710
  %t803 = icmp eq i64 %t802, 900
  %t804 = zext i1 %t803 to i64
  %t805 = icmp ne i64 %t804, 0
  br i1 %t805, label %then38, label %else38
then38:
  %t806 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.131)
  %t807 = ptrtoint ptr %t806 to i64
  %t808 = inttoptr i64 %t807 to ptr
  call void @intrinsic_print(ptr %t808)
  %t809 = load i64, ptr %local.window_avg.716
  %t810 = call i64 @"print_f64"(i64 %t809)
  %t811 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.132)
  %t812 = ptrtoint ptr %t811 to i64
  %t813 = inttoptr i64 %t812 to ptr
  call void @intrinsic_print(ptr %t813)
  %t814 = load i64, ptr %local.s_local.717
  %t815 = call i64 @"print_f64"(i64 %t814)
  %t816 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.133)
  %t817 = ptrtoint ptr %t816 to i64
  %t818 = inttoptr i64 %t817 to ptr
  call void @intrinsic_println(ptr %t818)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t819 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t820 = load i64, ptr %local.step.710
  %t821 = icmp eq i64 %t820, 1050
  %t822 = zext i1 %t821 to i64
  %t823 = icmp ne i64 %t822, 0
  br i1 %t823, label %then39, label %else39
then39:
  %t824 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.134)
  %t825 = ptrtoint ptr %t824 to i64
  %t826 = inttoptr i64 %t825 to ptr
  call void @intrinsic_print(ptr %t826)
  %t827 = load i64, ptr %local.window_avg.716
  %t828 = call i64 @"print_f64"(i64 %t827)
  %t829 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.135)
  %t830 = ptrtoint ptr %t829 to i64
  %t831 = inttoptr i64 %t830 to ptr
  call void @intrinsic_print(ptr %t831)
  %t832 = load i64, ptr %local.s_local.717
  %t833 = call i64 @"print_f64"(i64 %t832)
  %t834 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.136)
  %t835 = ptrtoint ptr %t834 to i64
  %t836 = inttoptr i64 %t835 to ptr
  call void @intrinsic_println(ptr %t836)
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t837 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t838 = load i64, ptr %local.step.710
  %t839 = icmp eq i64 %t838, 1200
  %t840 = zext i1 %t839 to i64
  %t841 = icmp ne i64 %t840, 0
  br i1 %t841, label %then40, label %else40
then40:
  %t842 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.137)
  %t843 = ptrtoint ptr %t842 to i64
  %t844 = inttoptr i64 %t843 to ptr
  call void @intrinsic_print(ptr %t844)
  %t845 = load i64, ptr %local.window_avg.716
  %t846 = call i64 @"print_f64"(i64 %t845)
  %t847 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.138)
  %t848 = ptrtoint ptr %t847 to i64
  %t849 = inttoptr i64 %t848 to ptr
  call void @intrinsic_print(ptr %t849)
  %t850 = load i64, ptr %local.s_local.717
  %t851 = call i64 @"print_f64"(i64 %t850)
  %t852 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.139)
  %t853 = ptrtoint ptr %t852 to i64
  %t854 = inttoptr i64 %t853 to ptr
  call void @intrinsic_println(ptr %t854)
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t855 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t856 = load i64, ptr %local.step.710
  %t857 = icmp eq i64 %t856, 1500
  %t858 = zext i1 %t857 to i64
  %t859 = icmp ne i64 %t858, 0
  br i1 %t859, label %then41, label %else41
then41:
  %t860 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.140)
  %t861 = ptrtoint ptr %t860 to i64
  %t862 = inttoptr i64 %t861 to ptr
  call void @intrinsic_print(ptr %t862)
  %t863 = load i64, ptr %local.window_avg.716
  %t864 = call i64 @"print_f64"(i64 %t863)
  %t865 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.141)
  %t866 = ptrtoint ptr %t865 to i64
  %t867 = inttoptr i64 %t866 to ptr
  call void @intrinsic_print(ptr %t867)
  %t868 = load i64, ptr %local.s_local.717
  %t869 = call i64 @"print_f64"(i64 %t868)
  %t870 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.142)
  %t871 = ptrtoint ptr %t870 to i64
  %t872 = inttoptr i64 %t871 to ptr
  call void @intrinsic_println(ptr %t872)
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t873 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t874 = load i64, ptr %local.step.710
  %t875 = icmp eq i64 %t874, 1900
  %t876 = zext i1 %t875 to i64
  %t877 = icmp ne i64 %t876, 0
  br i1 %t877, label %then42, label %else42
then42:
  %t878 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.143)
  %t879 = ptrtoint ptr %t878 to i64
  %t880 = inttoptr i64 %t879 to ptr
  call void @intrinsic_print(ptr %t880)
  %t881 = load i64, ptr %local.window_avg.716
  %t882 = call i64 @"print_f64"(i64 %t881)
  %t883 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.144)
  %t884 = ptrtoint ptr %t883 to i64
  %t885 = inttoptr i64 %t884 to ptr
  call void @intrinsic_print(ptr %t885)
  %t886 = load i64, ptr %local.s_local.717
  %t887 = call i64 @"print_f64"(i64 %t886)
  %t888 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.145)
  %t889 = ptrtoint ptr %t888 to i64
  %t890 = inttoptr i64 %t889 to ptr
  call void @intrinsic_println(ptr %t890)
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t891 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t892 = load i64, ptr %local.window_avg.716
  store i64 %t892, ptr %local.prev_window_avg.715
  %t893 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.146)
  store i64 %t893, ptr %local.window_sum.713
  store i64 0, ptr %local.window_count.714
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t894 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t895 = load i64, ptr %local.x.709
  store i64 %t895, ptr %local.prev_x.711
  %t896 = load i64, ptr %local.step.710
  %t897 = add i64 %t896, 1
  store i64 %t897, ptr %local.step.710
  br label %loop33
endloop33:
  %t898 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.147)
  %t899 = ptrtoint ptr %t898 to i64
  %t900 = inttoptr i64 %t899 to ptr
  call void @intrinsic_println(ptr %t900)
  %t901 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.148)
  %t902 = ptrtoint ptr %t901 to i64
  %t903 = inttoptr i64 %t902 to ptr
  call void @intrinsic_println(ptr %t903)
  %t904 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.149)
  %t905 = ptrtoint ptr %t904 to i64
  %t906 = inttoptr i64 %t905 to ptr
  call void @intrinsic_println(ptr %t906)
  %t907 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.150)
  %t908 = ptrtoint ptr %t907 to i64
  %t909 = inttoptr i64 %t908 to ptr
  call void @intrinsic_println(ptr %t909)
  ret i64 0
}

define i64 @"logistic_lyapunov"(i64 %r) nounwind {
entry:
  %local.x.910 = alloca i64
  %local.sum.911 = alloca i64
  %local.step.912 = alloca i64
  %local.deriv.913 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %t914 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.151)
  store i64 %t914, ptr %local.x.910
  %t915 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.152)
  store i64 %t915, ptr %local.sum.911
  store i64 0, ptr %local.step.912
  br label %loop43
loop43:
  %t916 = load i64, ptr %local.step.912
  %t917 = icmp slt i64 %t916, 500
  %t918 = zext i1 %t917 to i64
  %t919 = icmp ne i64 %t918, 0
  br i1 %t919, label %body43, label %endloop43
body43:
  %t920 = load i64, ptr %local.r
  %t921 = load i64, ptr %local.x.910
  %t922 = call i64 @"sx_f64_mul"(i64 %t920, i64 %t921)
  %t923 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.153)
  %t924 = load i64, ptr %local.x.910
  %t925 = call i64 @"sx_f64_sub"(i64 %t923, i64 %t924)
  %t926 = call i64 @"sx_f64_mul"(i64 %t922, i64 %t925)
  store i64 %t926, ptr %local.x.910
  %t927 = load i64, ptr %local.step.912
  %t928 = add i64 %t927, 1
  store i64 %t928, ptr %local.step.912
  br label %loop43
endloop43:
  store i64 0, ptr %local.step.912
  br label %loop44
loop44:
  %t929 = load i64, ptr %local.step.912
  %t930 = icmp slt i64 %t929, 5000
  %t931 = zext i1 %t930 to i64
  %t932 = icmp ne i64 %t931, 0
  br i1 %t932, label %body44, label %endloop44
body44:
  %t933 = load i64, ptr %local.r
  %t934 = load i64, ptr %local.x.910
  %t935 = call i64 @"sx_f64_mul"(i64 %t933, i64 %t934)
  %t936 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.154)
  %t937 = load i64, ptr %local.x.910
  %t938 = call i64 @"sx_f64_sub"(i64 %t936, i64 %t937)
  %t939 = call i64 @"sx_f64_mul"(i64 %t935, i64 %t938)
  store i64 %t939, ptr %local.x.910
  %t940 = load i64, ptr %local.r
  %t941 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.155)
  %t942 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.156)
  %t943 = load i64, ptr %local.x.910
  %t944 = call i64 @"sx_f64_mul"(i64 %t942, i64 %t943)
  %t945 = call i64 @"sx_f64_sub"(i64 %t941, i64 %t944)
  %t946 = call i64 @"sx_f64_mul"(i64 %t940, i64 %t945)
  %t947 = call i64 @"abs_f64"(i64 %t946)
  store i64 %t947, ptr %local.deriv.913
  %t948 = load i64, ptr %local.deriv.913
  %t949 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.157)
  %t950 = call i64 @"sx_f64_gt"(i64 %t948, i64 %t949)
  %t951 = icmp ne i64 %t950, 0
  br i1 %t951, label %then45, label %else45
then45:
  %t952 = load i64, ptr %local.sum.911
  %t953 = load i64, ptr %local.deriv.913
  %t954 = call i64 @"ln_f64"(i64 %t953)
  %t955 = call i64 @"sx_f64_add"(i64 %t952, i64 %t954)
  store i64 %t955, ptr %local.sum.911
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t956 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t957 = load i64, ptr %local.step.912
  %t958 = add i64 %t957, 1
  store i64 %t958, ptr %local.step.912
  br label %loop44
endloop44:
  %t959 = load i64, ptr %local.sum.911
  %t960 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.158)
  %t961 = call i64 @"sx_f64_div"(i64 %t959, i64 %t960)
  ret i64 %t961
}

define i64 @"logistic_S"(i64 %r) nounwind {
entry:
  %local.x.962 = alloca i64
  %local.step.963 = alloca i64
  %local.early_d.964 = alloca i64
  %local.late_d.965 = alloca i64
  %local.prev_x.966 = alloca i64
  %local.count_e.967 = alloca i64
  %local.count_l.968 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %t969 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.159)
  store i64 %t969, ptr %local.x.962
  store i64 0, ptr %local.step.963
  %t970 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.160)
  store i64 %t970, ptr %local.early_d.964
  %t971 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.161)
  store i64 %t971, ptr %local.late_d.965
  %t972 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.162)
  store i64 %t972, ptr %local.prev_x.966
  store i64 0, ptr %local.count_e.967
  store i64 0, ptr %local.count_l.968
  br label %loop46
loop46:
  %t973 = load i64, ptr %local.step.963
  %t974 = icmp slt i64 %t973, 3000
  %t975 = zext i1 %t974 to i64
  %t976 = icmp ne i64 %t975, 0
  br i1 %t976, label %body46, label %endloop46
body46:
  %t977 = load i64, ptr %local.r
  %t978 = load i64, ptr %local.x.962
  %t979 = call i64 @"sx_f64_mul"(i64 %t977, i64 %t978)
  %t980 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.163)
  %t981 = load i64, ptr %local.x.962
  %t982 = call i64 @"sx_f64_sub"(i64 %t980, i64 %t981)
  %t983 = call i64 @"sx_f64_mul"(i64 %t979, i64 %t982)
  store i64 %t983, ptr %local.x.962
  %t984 = load i64, ptr %local.step.963
  %t985 = icmp sgt i64 %t984, 200
  %t986 = zext i1 %t985 to i64
  %t987 = icmp ne i64 %t986, 0
  br i1 %t987, label %then47, label %else47
then47:
  %t988 = load i64, ptr %local.step.963
  %t989 = icmp slt i64 %t988, 1200
  %t990 = zext i1 %t989 to i64
  %t991 = icmp ne i64 %t990, 0
  br i1 %t991, label %then48, label %else48
then48:
  %t992 = load i64, ptr %local.early_d.964
  %t993 = load i64, ptr %local.x.962
  %t994 = load i64, ptr %local.prev_x.966
  %t995 = call i64 @"sx_f64_sub"(i64 %t993, i64 %t994)
  %t996 = call i64 @"abs_f64"(i64 %t995)
  %t997 = call i64 @"sx_f64_add"(i64 %t992, i64 %t996)
  store i64 %t997, ptr %local.early_d.964
  %t998 = load i64, ptr %local.count_e.967
  %t999 = add i64 %t998, 1
  store i64 %t999, ptr %local.count_e.967
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1000 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t1001 = load i64, ptr %local.step.963
  %t1002 = icmp sgt i64 %t1001, 2000
  %t1003 = zext i1 %t1002 to i64
  %t1004 = icmp ne i64 %t1003, 0
  br i1 %t1004, label %then49, label %else49
then49:
  %t1005 = load i64, ptr %local.late_d.965
  %t1006 = load i64, ptr %local.x.962
  %t1007 = load i64, ptr %local.prev_x.966
  %t1008 = call i64 @"sx_f64_sub"(i64 %t1006, i64 %t1007)
  %t1009 = call i64 @"abs_f64"(i64 %t1008)
  %t1010 = call i64 @"sx_f64_add"(i64 %t1005, i64 %t1009)
  store i64 %t1010, ptr %local.late_d.965
  %t1011 = load i64, ptr %local.count_l.968
  %t1012 = add i64 %t1011, 1
  store i64 %t1012, ptr %local.count_l.968
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1013 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1014 = phi i64 [ %t1013, %then47_end ], [ 0, %else47_end ]
  %t1015 = load i64, ptr %local.x.962
  store i64 %t1015, ptr %local.prev_x.966
  %t1016 = load i64, ptr %local.step.963
  %t1017 = add i64 %t1016, 1
  store i64 %t1017, ptr %local.step.963
  br label %loop46
endloop46:
  %t1018 = load i64, ptr %local.count_e.967
  %t1019 = icmp sgt i64 %t1018, 0
  %t1020 = zext i1 %t1019 to i64
  %t1021 = icmp ne i64 %t1020, 0
  br i1 %t1021, label %then50, label %else50
then50:
  %t1022 = load i64, ptr %local.early_d.964
  %t1023 = load i64, ptr %local.count_e.967
  %t1024 = call i64 @"sx_int_to_f64"(i64 %t1023)
  %t1025 = call i64 @"sx_f64_div"(i64 %t1022, i64 %t1024)
  store i64 %t1025, ptr %local.early_d.964
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1026 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t1027 = load i64, ptr %local.count_l.968
  %t1028 = icmp sgt i64 %t1027, 0
  %t1029 = zext i1 %t1028 to i64
  %t1030 = icmp ne i64 %t1029, 0
  br i1 %t1030, label %then51, label %else51
then51:
  %t1031 = load i64, ptr %local.late_d.965
  %t1032 = load i64, ptr %local.count_l.968
  %t1033 = call i64 @"sx_int_to_f64"(i64 %t1032)
  %t1034 = call i64 @"sx_f64_div"(i64 %t1031, i64 %t1033)
  store i64 %t1034, ptr %local.late_d.965
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t1035 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t1036 = load i64, ptr %local.early_d.964
  %t1037 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.164)
  %t1038 = call i64 @"sx_f64_gt"(i64 %t1036, i64 %t1037)
  %t1039 = icmp ne i64 %t1038, 0
  br i1 %t1039, label %then52, label %else52
then52:
  %t1040 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.165)
  %t1041 = load i64, ptr %local.late_d.965
  %t1042 = load i64, ptr %local.early_d.964
  %t1043 = call i64 @"sx_f64_div"(i64 %t1041, i64 %t1042)
  %t1044 = call i64 @"sx_f64_sub"(i64 %t1040, i64 %t1043)
  br label %then52_end
then52_end:
  br label %endif52
else52:
  %t1045 = load i64, ptr %local.late_d.965
  %t1046 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.166)
  %t1047 = call i64 @"sx_f64_lt"(i64 %t1045, i64 %t1046)
  %t1048 = icmp ne i64 %t1047, 0
  br i1 %t1048, label %then53, label %else53
then53:
  %t1049 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.167)
  br label %then53_end
then53_end:
  br label %endif53
else53:
  %t1050 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.168)
  %t1051 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.169)
  %t1052 = call i64 @"sx_f64_sub"(i64 %t1050, i64 %t1051)
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t1053 = phi i64 [ %t1049, %then53_end ], [ %t1052, %else53_end ]
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t1054 = phi i64 [ %t1044, %then52_end ], [ %t1053, %else52_end ]
  ret i64 %t1054
}

define i64 @"test_s_lambda"() nounwind {
entry:
  %local.r.1055 = alloca i64
  %local.agree.1056 = alloca i64
  %local.total.1057 = alloca i64
  %local.lam.1058 = alloca i64
  %local.s.1059 = alloca i64
  %t1060 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.170)
  %t1061 = ptrtoint ptr %t1060 to i64
  %t1062 = inttoptr i64 %t1061 to ptr
  call void @intrinsic_println(ptr %t1062)
  %t1063 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.171)
  %t1064 = ptrtoint ptr %t1063 to i64
  %t1065 = inttoptr i64 %t1064 to ptr
  call void @intrinsic_println(ptr %t1065)
  %t1066 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.172)
  store i64 %t1066, ptr %local.r.1055
  store i64 0, ptr %local.agree.1056
  store i64 0, ptr %local.total.1057
  br label %loop54
loop54:
  %t1067 = load i64, ptr %local.r.1055
  %t1068 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.173)
  %t1069 = call i64 @"sx_f64_lt"(i64 %t1067, i64 %t1068)
  %t1070 = icmp ne i64 %t1069, 0
  br i1 %t1070, label %body54, label %endloop54
body54:
  %t1071 = load i64, ptr %local.r.1055
  %t1072 = call i64 @"logistic_lyapunov"(i64 %t1071)
  store i64 %t1072, ptr %local.lam.1058
  %t1073 = load i64, ptr %local.r.1055
  %t1074 = call i64 @"logistic_S"(i64 %t1073)
  store i64 %t1074, ptr %local.s.1059
  %t1075 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.174)
  %t1076 = ptrtoint ptr %t1075 to i64
  %t1077 = inttoptr i64 %t1076 to ptr
  call void @intrinsic_print(ptr %t1077)
  %t1078 = load i64, ptr %local.r.1055
  %t1079 = call i64 @"print_f64"(i64 %t1078)
  %t1080 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.175)
  %t1081 = ptrtoint ptr %t1080 to i64
  %t1082 = inttoptr i64 %t1081 to ptr
  call void @intrinsic_print(ptr %t1082)
  %t1083 = load i64, ptr %local.lam.1058
  %t1084 = call i64 @"print_f64"(i64 %t1083)
  %t1085 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.176)
  %t1086 = ptrtoint ptr %t1085 to i64
  %t1087 = inttoptr i64 %t1086 to ptr
  call void @intrinsic_print(ptr %t1087)
  %t1088 = load i64, ptr %local.s.1059
  %t1089 = call i64 @"print_f64"(i64 %t1088)
  %t1090 = load i64, ptr %local.total.1057
  %t1091 = add i64 %t1090, 1
  store i64 %t1091, ptr %local.total.1057
  %t1092 = load i64, ptr %local.lam.1058
  %t1093 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.177)
  %t1094 = call i64 @"sx_f64_lt"(i64 %t1092, i64 %t1093)
  %t1095 = icmp ne i64 %t1094, 0
  br i1 %t1095, label %then55, label %else55
then55:
  %t1096 = load i64, ptr %local.s.1059
  %t1097 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.178)
  %t1098 = call i64 @"sx_f64_gt"(i64 %t1096, i64 %t1097)
  %t1099 = icmp ne i64 %t1098, 0
  br i1 %t1099, label %then56, label %else56
then56:
  %t1100 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.179)
  %t1101 = ptrtoint ptr %t1100 to i64
  %t1102 = inttoptr i64 %t1101 to ptr
  call void @intrinsic_println(ptr %t1102)
  %t1103 = load i64, ptr %local.agree.1056
  %t1104 = add i64 %t1103, 1
  store i64 %t1104, ptr %local.agree.1056
  br label %then56_end
then56_end:
  br label %endif56
else56:
  %t1105 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.180)
  %t1106 = ptrtoint ptr %t1105 to i64
  %t1107 = inttoptr i64 %t1106 to ptr
  call void @intrinsic_println(ptr %t1107)
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t1108 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  br label %then55_end
then55_end:
  br label %endif55
else55:
  %t1109 = load i64, ptr %local.s.1059
  %t1110 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.181)
  %t1111 = call i64 @"sx_f64_lt"(i64 %t1109, i64 %t1110)
  %t1112 = icmp ne i64 %t1111, 0
  br i1 %t1112, label %then57, label %else57
then57:
  %t1113 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.182)
  %t1114 = ptrtoint ptr %t1113 to i64
  %t1115 = inttoptr i64 %t1114 to ptr
  call void @intrinsic_println(ptr %t1115)
  %t1116 = load i64, ptr %local.agree.1056
  %t1117 = add i64 %t1116, 1
  store i64 %t1117, ptr %local.agree.1056
  br label %then57_end
then57_end:
  br label %endif57
else57:
  %t1118 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.183)
  %t1119 = ptrtoint ptr %t1118 to i64
  %t1120 = inttoptr i64 %t1119 to ptr
  call void @intrinsic_println(ptr %t1120)
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t1121 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t1122 = phi i64 [ %t1108, %then55_end ], [ %t1121, %else55_end ]
  %t1123 = load i64, ptr %local.r.1055
  %t1124 = call i64 @f64_parse(ptr @.str.exp_s_vs_lyapunov.184)
  %t1125 = call i64 @"sx_f64_add"(i64 %t1123, i64 %t1124)
  store i64 %t1125, ptr %local.r.1055
  br label %loop54
endloop54:
  %t1126 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.185)
  %t1127 = ptrtoint ptr %t1126 to i64
  %t1128 = inttoptr i64 %t1127 to ptr
  call void @intrinsic_println(ptr %t1128)
  %t1129 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.186)
  %t1130 = ptrtoint ptr %t1129 to i64
  %t1131 = inttoptr i64 %t1130 to ptr
  call void @intrinsic_print(ptr %t1131)
  %t1132 = load i64, ptr %local.agree.1056
  call void @print_i64(i64 %t1132)
  %t1133 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.187)
  %t1134 = ptrtoint ptr %t1133 to i64
  %t1135 = inttoptr i64 %t1134 to ptr
  call void @intrinsic_print(ptr %t1135)
  %t1136 = load i64, ptr %local.total.1057
  call void @print_i64(i64 %t1136)
  %t1137 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.188)
  %t1138 = ptrtoint ptr %t1137 to i64
  %t1139 = inttoptr i64 %t1138 to ptr
  call void @intrinsic_println(ptr %t1139)
  %t1140 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.189)
  %t1141 = ptrtoint ptr %t1140 to i64
  %t1142 = inttoptr i64 %t1141 to ptr
  call void @intrinsic_println(ptr %t1142)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1143 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.190)
  %t1144 = ptrtoint ptr %t1143 to i64
  %t1145 = inttoptr i64 %t1144 to ptr
  call void @intrinsic_println(ptr %t1145)
  %t1146 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.191)
  %t1147 = ptrtoint ptr %t1146 to i64
  %t1148 = inttoptr i64 %t1147 to ptr
  call void @intrinsic_println(ptr %t1148)
  %t1149 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.192)
  %t1150 = ptrtoint ptr %t1149 to i64
  %t1151 = inttoptr i64 %t1150 to ptr
  call void @intrinsic_println(ptr %t1151)
  %t1152 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.193)
  %t1153 = ptrtoint ptr %t1152 to i64
  %t1154 = inttoptr i64 %t1153 to ptr
  call void @intrinsic_println(ptr %t1154)
  %t1155 = call i64 @"test_coupled_maps"()
  %t1156 = call i64 @"test_s_spectrum"()
  %t1157 = call i64 @"test_noisy"()
  %t1158 = call i64 @"test_regime_change"()
  %t1159 = call i64 @"test_s_lambda"()
  %t1160 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.194)
  %t1161 = ptrtoint ptr %t1160 to i64
  %t1162 = inttoptr i64 %t1161 to ptr
  call void @intrinsic_println(ptr %t1162)
  %t1163 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.195)
  %t1164 = ptrtoint ptr %t1163 to i64
  %t1165 = inttoptr i64 %t1164 to ptr
  call void @intrinsic_println(ptr %t1165)
  %t1166 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.196)
  %t1167 = ptrtoint ptr %t1166 to i64
  %t1168 = inttoptr i64 %t1167 to ptr
  call void @intrinsic_println(ptr %t1168)
  %t1169 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.197)
  %t1170 = ptrtoint ptr %t1169 to i64
  %t1171 = inttoptr i64 %t1170 to ptr
  call void @intrinsic_println(ptr %t1171)
  %t1172 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.198)
  %t1173 = ptrtoint ptr %t1172 to i64
  %t1174 = inttoptr i64 %t1173 to ptr
  call void @intrinsic_println(ptr %t1174)
  %t1175 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.199)
  %t1176 = ptrtoint ptr %t1175 to i64
  %t1177 = inttoptr i64 %t1176 to ptr
  call void @intrinsic_println(ptr %t1177)
  %t1178 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.200)
  %t1179 = ptrtoint ptr %t1178 to i64
  %t1180 = inttoptr i64 %t1179 to ptr
  call void @intrinsic_println(ptr %t1180)
  %t1181 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.201)
  %t1182 = ptrtoint ptr %t1181 to i64
  %t1183 = inttoptr i64 %t1182 to ptr
  call void @intrinsic_println(ptr %t1183)
  %t1184 = call ptr @intrinsic_string_new(ptr @.str.exp_s_vs_lyapunov.202)
  %t1185 = ptrtoint ptr %t1184 to i64
  %t1186 = inttoptr i64 %t1185 to ptr
  call void @intrinsic_println(ptr %t1186)
  ret i64 0
}


; String constants
@.str.exp_s_vs_lyapunov.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.2 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_s_vs_lyapunov.3 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_s_vs_lyapunov.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.6 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_s_vs_lyapunov.7 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_s_vs_lyapunov.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.10 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.11 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.12 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.13 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.14 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_vs_lyapunov.15 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_s_vs_lyapunov.16 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_s_vs_lyapunov.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.19 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_s_vs_lyapunov.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.22 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.23 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.24 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_vs_lyapunov.25 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.26 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_vs_lyapunov.27 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.29 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.30 = private unnamed_addr constant [37 x i8] c"--- Exp 1: Coupled Logistic Maps ---\00"
@.str.exp_s_vs_lyapunov.31 = private unnamed_addr constant [46 x i8] c"  r=3.7 (chaotic uncoupled), sweep coupling c\00"
@.str.exp_s_vs_lyapunov.32 = private unnamed_addr constant [55 x i8] c"  S detects synchronisation WITHOUT computing Jacobian\00"
@.str.exp_s_vs_lyapunov.33 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.34 = private unnamed_addr constant [54 x i8] c"  coupling   S_score      drift        interpretation\00"
@.str.exp_s_vs_lyapunov.35 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.36 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_s_vs_lyapunov.37 = private unnamed_addr constant [4 x i8] c"3.7\00"
@.str.exp_s_vs_lyapunov.38 = private unnamed_addr constant [4 x i8] c"3.7\00"
@.str.exp_s_vs_lyapunov.39 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.40 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_s_vs_lyapunov.41 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.42 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_s_vs_lyapunov.43 = private unnamed_addr constant [15 x i8] c"  SYNCHRONISED\00"
@.str.exp_s_vs_lyapunov.44 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_s_vs_lyapunov.45 = private unnamed_addr constant [15 x i8] c"  PARTIAL SYNC\00"
@.str.exp_s_vs_lyapunov.46 = private unnamed_addr constant [10 x i8] c"  CHAOTIC\00"
@.str.exp_s_vs_lyapunov.47 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.48 = private unnamed_addr constant [48 x i8] c"  KEY: S detects the synchronisation transition\00"
@.str.exp_s_vs_lyapunov.49 = private unnamed_addr constant [52 x i8] c"  in coupled maps WITHOUT the Jacobian eigenvalues.\00"
@.str.exp_s_vs_lyapunov.50 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.51 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_vs_lyapunov.52 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.53 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.54 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_vs_lyapunov.55 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.56 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_vs_lyapunov.57 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.58 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_vs_lyapunov.59 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.60 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.61 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.62 = private unnamed_addr constant [48 x i8] c"--- Exp 2: S Spectrum (Multiple Timescales) ---\00"
@.str.exp_s_vs_lyapunov.63 = private unnamed_addr constant [37 x i8] c"  Logistic map at different r values\00"
@.str.exp_s_vs_lyapunov.64 = private unnamed_addr constant [48 x i8] c"  S computed with window sizes 10, 50, 200, 500\00"
@.str.exp_s_vs_lyapunov.65 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.66 = private unnamed_addr constant [51 x i8] c"  r      S(w=10)    S(w=50)    S(w=200)   S(w=500)\00"
@.str.exp_s_vs_lyapunov.67 = private unnamed_addr constant [4 x i8] c"2.8\00"
@.str.exp_s_vs_lyapunov.68 = private unnamed_addr constant [5 x i8] c"4.01\00"
@.str.exp_s_vs_lyapunov.69 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.70 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.71 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.72 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.73 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.74 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.75 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_vs_lyapunov.76 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.77 = private unnamed_addr constant [60 x i8] c"  If all windows agree: system behaviour is scale-invariant\00"
@.str.exp_s_vs_lyapunov.78 = private unnamed_addr constant [63 x i8] c"  If they disagree: behaviour depends on observation timescale\00"
@.str.exp_s_vs_lyapunov.79 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.80 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.81 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_s_vs_lyapunov.82 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_vs_lyapunov.83 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_vs_lyapunov.84 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.86 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_vs_lyapunov.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.88 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.89 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_vs_lyapunov.90 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.91 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.92 = private unnamed_addr constant [37 x i8] c"--- Exp 3: S Robustness to Noise ---\00"
@.str.exp_s_vs_lyapunov.93 = private unnamed_addr constant [52 x i8] c"  Logistic map + Gaussian noise at different levels\00"
@.str.exp_s_vs_lyapunov.94 = private unnamed_addr constant [45 x i8] c"  Does S still distinguish order from chaos?\00"
@.str.exp_s_vs_lyapunov.95 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.96 = private unnamed_addr constant [58 x i8] c"  noise    S(r=2.8,order)  S(r=3.2,trans)  S(r=3.8,chaos)\00"
@.str.exp_s_vs_lyapunov.97 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.98 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_s_vs_lyapunov.99 = private unnamed_addr constant [4 x i8] c"2.8\00"
@.str.exp_s_vs_lyapunov.100 = private unnamed_addr constant [4 x i8] c"3.2\00"
@.str.exp_s_vs_lyapunov.101 = private unnamed_addr constant [4 x i8] c"3.8\00"
@.str.exp_s_vs_lyapunov.102 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.103 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_s_vs_lyapunov.104 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.105 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.106 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.107 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.108 = private unnamed_addr constant [46 x i8] c"  If S(order) > S(chaos) at all noise levels:\00"
@.str.exp_s_vs_lyapunov.109 = private unnamed_addr constant [36 x i8] c"  S is ROBUST to measurement noise.\00"
@.str.exp_s_vs_lyapunov.110 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.111 = private unnamed_addr constant [39 x i8] c"--- Exp 4: Regime Change Detection ---\00"
@.str.exp_s_vs_lyapunov.112 = private unnamed_addr constant [46 x i8] c"  r=2.8 (order) -> r=3.8 (chaos) at step 1000\00"
@.str.exp_s_vs_lyapunov.113 = private unnamed_addr constant [41 x i8] c"  Track S in sliding window of 100 steps\00"
@.str.exp_s_vs_lyapunov.114 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.115 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_vs_lyapunov.116 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_vs_lyapunov.117 = private unnamed_addr constant [4 x i8] c"2.8\00"
@.str.exp_s_vs_lyapunov.118 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.119 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.120 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.121 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.122 = private unnamed_addr constant [39 x i8] c"  step    r     window_drift   S_local\00"
@.str.exp_s_vs_lyapunov.123 = private unnamed_addr constant [4 x i8] c"3.8\00"
@.str.exp_s_vs_lyapunov.124 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.125 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_vs_lyapunov.126 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.127 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.128 = private unnamed_addr constant [17 x i8] c"  500     2.8   \00"
@.str.exp_s_vs_lyapunov.129 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.130 = private unnamed_addr constant [10 x i8] c"  (order)\00"
@.str.exp_s_vs_lyapunov.131 = private unnamed_addr constant [17 x i8] c"  900     2.8   \00"
@.str.exp_s_vs_lyapunov.132 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.133 = private unnamed_addr constant [16 x i8] c"  (still order)\00"
@.str.exp_s_vs_lyapunov.134 = private unnamed_addr constant [17 x i8] c"  1050    3.8   \00"
@.str.exp_s_vs_lyapunov.135 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.136 = private unnamed_addr constant [18 x i8] c"  (just changed!)\00"
@.str.exp_s_vs_lyapunov.137 = private unnamed_addr constant [17 x i8] c"  1200    3.8   \00"
@.str.exp_s_vs_lyapunov.138 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.139 = private unnamed_addr constant [19 x i8] c"  (chaos settling)\00"
@.str.exp_s_vs_lyapunov.140 = private unnamed_addr constant [17 x i8] c"  1500    3.8   \00"
@.str.exp_s_vs_lyapunov.141 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.142 = private unnamed_addr constant [15 x i8] c"  (full chaos)\00"
@.str.exp_s_vs_lyapunov.143 = private unnamed_addr constant [17 x i8] c"  1900    3.8   \00"
@.str.exp_s_vs_lyapunov.144 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.145 = private unnamed_addr constant [18 x i8] c"  (settled chaos)\00"
@.str.exp_s_vs_lyapunov.146 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.147 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.148 = private unnamed_addr constant [43 x i8] c"  S should drop sharply at step ~1050-1100\00"
@.str.exp_s_vs_lyapunov.149 = private unnamed_addr constant [45 x i8] c"  (within 50-100 steps of the regime change)\00"
@.str.exp_s_vs_lyapunov.150 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.151 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_vs_lyapunov.152 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.153 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.154 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.155 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.156 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_vs_lyapunov.157 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_vs_lyapunov.158 = private unnamed_addr constant [7 x i8] c"5000.0\00"
@.str.exp_s_vs_lyapunov.159 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_vs_lyapunov.160 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.161 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.162 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_vs_lyapunov.163 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.164 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_vs_lyapunov.165 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.166 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_vs_lyapunov.167 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.168 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.169 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_vs_lyapunov.170 = private unnamed_addr constant [38 x i8] c"--- Exp 5: S vs Lyapunov Exponent ---\00"
@.str.exp_s_vs_lyapunov.171 = private unnamed_addr constant [51 x i8] c"  r       λ (Lyapunov)   S (ours)      Agreement?\00"
@.str.exp_s_vs_lyapunov.172 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_s_vs_lyapunov.173 = private unnamed_addr constant [5 x i8] c"4.01\00"
@.str.exp_s_vs_lyapunov.174 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.175 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.176 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_vs_lyapunov.177 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_vs_lyapunov.178 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_s_vs_lyapunov.179 = private unnamed_addr constant [16 x i8] c"  AGREE (order)\00"
@.str.exp_s_vs_lyapunov.180 = private unnamed_addr constant [11 x i8] c"  DISAGREE\00"
@.str.exp_s_vs_lyapunov.181 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_s_vs_lyapunov.182 = private unnamed_addr constant [16 x i8] c"  AGREE (chaos)\00"
@.str.exp_s_vs_lyapunov.183 = private unnamed_addr constant [11 x i8] c"  DISAGREE\00"
@.str.exp_s_vs_lyapunov.184 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_vs_lyapunov.185 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.186 = private unnamed_addr constant [14 x i8] c"  Agreement: \00"
@.str.exp_s_vs_lyapunov.187 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.exp_s_vs_lyapunov.188 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.189 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.190 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_vs_lyapunov.191 = private unnamed_addr constant [38 x i8] c"  S vs LYAPUNOV: EXPANDING THE THEORY\00"
@.str.exp_s_vs_lyapunov.192 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_vs_lyapunov.193 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_vs_lyapunov.194 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_vs_lyapunov.195 = private unnamed_addr constant [16 x i8] c"  KEY FINDINGS:\00"
@.str.exp_s_vs_lyapunov.196 = private unnamed_addr constant [46 x i8] c"  1. S works on COUPLED systems (no Jacobian)\00"
@.str.exp_s_vs_lyapunov.197 = private unnamed_addr constant [54 x i8] c"  2. S spectrum reveals timescale-dependent behaviour\00"
@.str.exp_s_vs_lyapunov.198 = private unnamed_addr constant [38 x i8] c"  3. S is robust to measurement noise\00"
@.str.exp_s_vs_lyapunov.199 = private unnamed_addr constant [48 x i8] c"  4. S detects regime changes within ~100 steps\00"
@.str.exp_s_vs_lyapunov.200 = private unnamed_addr constant [46 x i8] c"  5. S agrees with Lyapunov on classification\00"
@.str.exp_s_vs_lyapunov.201 = private unnamed_addr constant [46 x i8] c"  6. S is MODEL-FREE: needs only observations\00"
@.str.exp_s_vs_lyapunov.202 = private unnamed_addr constant [45 x i8] c"============================================\00"
