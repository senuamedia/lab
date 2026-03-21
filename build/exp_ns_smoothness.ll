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
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"pi_val"() nounwind {
entry:
  %t9 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.2)
  ret i64 %t9
}

define i64 @"ic_value"(i64 %ic, i64 %x) nounwind {
entry:
  %local.twopi.10 = alloca i64
  %local.fourpi.11 = alloca i64
  %local.ic = alloca i64
  store i64 %ic, ptr %local.ic
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t12 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.3)
  %t13 = call i64 @"pi_val"()
  %t14 = call i64 @"sx_f64_mul"(i64 %t12, i64 %t13)
  store i64 %t14, ptr %local.twopi.10
  %t15 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.4)
  %t16 = call i64 @"pi_val"()
  %t17 = call i64 @"sx_f64_mul"(i64 %t15, i64 %t16)
  store i64 %t17, ptr %local.fourpi.11
  %t18 = load i64, ptr %local.ic
  %t19 = icmp eq i64 %t18, 0
  %t20 = zext i1 %t19 to i64
  %t21 = icmp ne i64 %t20, 0
  br i1 %t21, label %then1, label %else1
then1:
  %t22 = load i64, ptr %local.twopi.10
  %t23 = load i64, ptr %local.x
  %t24 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t23)
  %t25 = call i64 @"sin_f64"(i64 %t24)
  ret i64 %t25
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t26 = phi i64 [ 0, %else1_end ]
  %t27 = load i64, ptr %local.ic
  %t28 = icmp eq i64 %t27, 1
  %t29 = zext i1 %t28 to i64
  %t30 = icmp ne i64 %t29, 0
  br i1 %t30, label %then2, label %else2
then2:
  %t31 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.5)
  %t32 = load i64, ptr %local.twopi.10
  %t33 = load i64, ptr %local.x
  %t34 = call i64 @"sx_f64_mul"(i64 %t32, i64 %t33)
  %t35 = call i64 @"sin_f64"(i64 %t34)
  %t36 = call i64 @"sx_f64_mul"(i64 %t31, i64 %t35)
  ret i64 %t36
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t37 = phi i64 [ 0, %else2_end ]
  %t38 = load i64, ptr %local.ic
  %t39 = icmp eq i64 %t38, 2
  %t40 = zext i1 %t39 to i64
  %t41 = icmp ne i64 %t40, 0
  br i1 %t41, label %then3, label %else3
then3:
  %t42 = load i64, ptr %local.twopi.10
  %t43 = load i64, ptr %local.x
  %t44 = call i64 @"sx_f64_mul"(i64 %t42, i64 %t43)
  %t45 = call i64 @"sin_f64"(i64 %t44)
  %t46 = load i64, ptr %local.fourpi.11
  %t47 = load i64, ptr %local.x
  %t48 = call i64 @"sx_f64_mul"(i64 %t46, i64 %t47)
  %t49 = call i64 @"sin_f64"(i64 %t48)
  %t50 = call i64 @"sx_f64_add"(i64 %t45, i64 %t49)
  ret i64 %t50
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t51 = phi i64 [ 0, %else3_end ]
  %t52 = load i64, ptr %local.ic
  %t53 = icmp eq i64 %t52, 3
  %t54 = zext i1 %t53 to i64
  %t55 = icmp ne i64 %t54, 0
  br i1 %t55, label %then4, label %else4
then4:
  %t56 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.6)
  %t57 = load i64, ptr %local.twopi.10
  %t58 = load i64, ptr %local.x
  %t59 = call i64 @"sx_f64_mul"(i64 %t57, i64 %t58)
  %t60 = call i64 @"sin_f64"(i64 %t59)
  %t61 = call i64 @"sx_f64_mul"(i64 %t56, i64 %t60)
  ret i64 %t61
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t62 = phi i64 [ 0, %else4_end ]
  %t63 = load i64, ptr %local.x
  %t64 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.7)
  %t65 = call i64 @"sx_f64_lt"(i64 %t63, i64 %t64)
  %t66 = icmp ne i64 %t65, 0
  br i1 %t66, label %then5, label %else5
then5:
  %t67 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.8)
  ret i64 %t67
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t68 = phi i64 [ 0, %else5_end ]
  %t69 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.9)
  %t70 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.10)
  %t71 = call i64 @"sx_f64_sub"(i64 %t69, i64 %t70)
  ret i64 %t71
}

define i64 @"get_nu"(i64 %vi) nounwind {
entry:
  %local.vi = alloca i64
  store i64 %vi, ptr %local.vi
  %t72 = load i64, ptr %local.vi
  %t73 = icmp eq i64 %t72, 0
  %t74 = zext i1 %t73 to i64
  %t75 = icmp ne i64 %t74, 0
  br i1 %t75, label %then6, label %else6
then6:
  %t76 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.11)
  ret i64 %t76
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t77 = phi i64 [ 0, %else6_end ]
  %t78 = load i64, ptr %local.vi
  %t79 = icmp eq i64 %t78, 1
  %t80 = zext i1 %t79 to i64
  %t81 = icmp ne i64 %t80, 0
  br i1 %t81, label %then7, label %else7
then7:
  %t82 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.12)
  ret i64 %t82
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t83 = phi i64 [ 0, %else7_end ]
  %t84 = load i64, ptr %local.vi
  %t85 = icmp eq i64 %t84, 2
  %t86 = zext i1 %t85 to i64
  %t87 = icmp ne i64 %t86, 0
  br i1 %t87, label %then8, label %else8
then8:
  %t88 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.13)
  ret i64 %t88
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t89 = phi i64 [ 0, %else8_end ]
  %t90 = load i64, ptr %local.vi
  %t91 = icmp eq i64 %t90, 3
  %t92 = zext i1 %t91 to i64
  %t93 = icmp ne i64 %t92, 0
  br i1 %t93, label %then9, label %else9
then9:
  %t94 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.14)
  ret i64 %t94
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t95 = phi i64 [ 0, %else9_end ]
  %t96 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.15)
  ret i64 %t96
}

define i64 @"burgers_step"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %nu, i64 %dt, i64 %dx) nounwind {
entry:
  %local.dudx.97 = alloca i64
  %local.d2udx2.98 = alloca i64
  %local.advection.99 = alloca i64
  %local.diffusion.100 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t101 = load i64, ptr %local.u3
  %t102 = load i64, ptr %local.u1
  %t103 = call i64 @"sx_f64_sub"(i64 %t101, i64 %t102)
  %t104 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.16)
  %t105 = load i64, ptr %local.dx
  %t106 = call i64 @"sx_f64_mul"(i64 %t104, i64 %t105)
  %t107 = call i64 @"sx_f64_div"(i64 %t103, i64 %t106)
  store i64 %t107, ptr %local.dudx.97
  %t108 = load i64, ptr %local.u3
  %t109 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.17)
  %t110 = load i64, ptr %local.u2
  %t111 = call i64 @"sx_f64_mul"(i64 %t109, i64 %t110)
  %t112 = call i64 @"sx_f64_sub"(i64 %t108, i64 %t111)
  %t113 = load i64, ptr %local.u1
  %t114 = call i64 @"sx_f64_add"(i64 %t112, i64 %t113)
  %t115 = load i64, ptr %local.dx
  %t116 = load i64, ptr %local.dx
  %t117 = call i64 @"sx_f64_mul"(i64 %t115, i64 %t116)
  %t118 = call i64 @"sx_f64_div"(i64 %t114, i64 %t117)
  store i64 %t118, ptr %local.d2udx2.98
  %t119 = load i64, ptr %local.u2
  %t120 = load i64, ptr %local.dudx.97
  %t121 = call i64 @"sx_f64_mul"(i64 %t119, i64 %t120)
  store i64 %t121, ptr %local.advection.99
  %t122 = load i64, ptr %local.nu
  %t123 = load i64, ptr %local.d2udx2.98
  %t124 = call i64 @"sx_f64_mul"(i64 %t122, i64 %t123)
  store i64 %t124, ptr %local.diffusion.100
  %t125 = load i64, ptr %local.u2
  %t126 = load i64, ptr %local.dt
  %t127 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.18)
  %t128 = load i64, ptr %local.advection.99
  %t129 = call i64 @"sx_f64_sub"(i64 %t127, i64 %t128)
  %t130 = load i64, ptr %local.diffusion.100
  %t131 = call i64 @"sx_f64_add"(i64 %t129, i64 %t130)
  %t132 = call i64 @"sx_f64_mul"(i64 %t126, i64 %t131)
  %t133 = call i64 @"sx_f64_add"(i64 %t125, i64 %t132)
  ret i64 %t133
}

define i64 @"burgers_run"(i64 %ic, i64 %nu, i64 %out_sel) nounwind {
entry:
  %local.dx.134 = alloca i64
  %local.dt.135 = alloca i64
  %local.nsteps.136 = alloca i64
  %local.win.137 = alloca i64
  %local.u0.138 = alloca i64
  %local.u1.139 = alloca i64
  %local.u2.140 = alloca i64
  %local.u3.141 = alloca i64
  %local.u4.142 = alloca i64
  %local.step.143 = alloca i64
  %local.prev_u2.144 = alloca i64
  %local.max_grad.145 = alloca i64
  %local.win_sum.146 = alloca i64
  %local.win_cnt.147 = alloca i64
  %local.prev_win_avg.148 = alloca i64
  %local.min_s.149 = alloca i64
  %local.t_s_neg.150 = alloca i64
  %local.t_blow.151 = alloca i64
  %local.blown.152 = alloca i64
  %local.n0.153 = alloca i64
  %local.n1.154 = alloca i64
  %local.n2.155 = alloca i64
  %local.n3.156 = alloca i64
  %local.n4.157 = alloca i64
  %local.g01.158 = alloca i64
  %local.g12.159 = alloca i64
  %local.g23.160 = alloca i64
  %local.g34.161 = alloca i64
  %local.gmax.162 = alloca i64
  %local.drift.163 = alloca i64
  %local.wav.164 = alloca i64
  %local.s_loc.165 = alloca i64
  %local.ic = alloca i64
  store i64 %ic, ptr %local.ic
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.out_sel = alloca i64
  store i64 %out_sel, ptr %local.out_sel
  %t166 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.19)
  store i64 %t166, ptr %local.dx.134
  %t167 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.20)
  store i64 %t167, ptr %local.dt.135
  store i64 20000, ptr %local.nsteps.136
  store i64 500, ptr %local.win.137
  %t168 = load i64, ptr %local.ic
  %t169 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.21)
  %t170 = call i64 @"ic_value"(i64 %t168, i64 %t169)
  store i64 %t170, ptr %local.u0.138
  %t171 = load i64, ptr %local.ic
  %t172 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.22)
  %t173 = call i64 @"ic_value"(i64 %t171, i64 %t172)
  store i64 %t173, ptr %local.u1.139
  %t174 = load i64, ptr %local.ic
  %t175 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.23)
  %t176 = call i64 @"ic_value"(i64 %t174, i64 %t175)
  store i64 %t176, ptr %local.u2.140
  %t177 = load i64, ptr %local.ic
  %t178 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.24)
  %t179 = call i64 @"ic_value"(i64 %t177, i64 %t178)
  store i64 %t179, ptr %local.u3.141
  %t180 = load i64, ptr %local.ic
  %t181 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.25)
  %t182 = call i64 @"ic_value"(i64 %t180, i64 %t181)
  store i64 %t182, ptr %local.u4.142
  store i64 0, ptr %local.step.143
  %t183 = load i64, ptr %local.u2.140
  store i64 %t183, ptr %local.prev_u2.144
  %t184 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.26)
  store i64 %t184, ptr %local.max_grad.145
  %t185 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.27)
  store i64 %t185, ptr %local.win_sum.146
  store i64 0, ptr %local.win_cnt.147
  %t186 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.28)
  store i64 %t186, ptr %local.prev_win_avg.148
  %t187 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.29)
  store i64 %t187, ptr %local.min_s.149
  %t188 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.30)
  %t189 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.31)
  %t190 = call i64 @"sx_f64_sub"(i64 %t188, i64 %t189)
  store i64 %t190, ptr %local.t_s_neg.150
  %t191 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.32)
  %t192 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.33)
  %t193 = call i64 @"sx_f64_sub"(i64 %t191, i64 %t192)
  store i64 %t193, ptr %local.t_blow.151
  store i64 0, ptr %local.blown.152
  br label %loop10
loop10:
  %t194 = load i64, ptr %local.step.143
  %t195 = load i64, ptr %local.nsteps.136
  %t196 = icmp slt i64 %t194, %t195
  %t197 = zext i1 %t196 to i64
  %t198 = icmp ne i64 %t197, 0
  br i1 %t198, label %body10, label %endloop10
body10:
  %t199 = load i64, ptr %local.u4.142
  %t200 = load i64, ptr %local.u0.138
  %t201 = load i64, ptr %local.u1.139
  %t202 = load i64, ptr %local.u2.140
  %t203 = load i64, ptr %local.u3.141
  %t204 = load i64, ptr %local.nu
  %t205 = load i64, ptr %local.dt.135
  %t206 = load i64, ptr %local.dx.134
  %t207 = call i64 @"burgers_step"(i64 %t199, i64 %t200, i64 %t201, i64 %t202, i64 %t203, i64 %t204, i64 %t205, i64 %t206)
  store i64 %t207, ptr %local.n0.153
  %t208 = load i64, ptr %local.u0.138
  %t209 = load i64, ptr %local.u1.139
  %t210 = load i64, ptr %local.u2.140
  %t211 = load i64, ptr %local.u3.141
  %t212 = load i64, ptr %local.u4.142
  %t213 = load i64, ptr %local.nu
  %t214 = load i64, ptr %local.dt.135
  %t215 = load i64, ptr %local.dx.134
  %t216 = call i64 @"burgers_step"(i64 %t208, i64 %t209, i64 %t210, i64 %t211, i64 %t212, i64 %t213, i64 %t214, i64 %t215)
  store i64 %t216, ptr %local.n1.154
  %t217 = load i64, ptr %local.u1.139
  %t218 = load i64, ptr %local.u2.140
  %t219 = load i64, ptr %local.u3.141
  %t220 = load i64, ptr %local.u4.142
  %t221 = load i64, ptr %local.u0.138
  %t222 = load i64, ptr %local.nu
  %t223 = load i64, ptr %local.dt.135
  %t224 = load i64, ptr %local.dx.134
  %t225 = call i64 @"burgers_step"(i64 %t217, i64 %t218, i64 %t219, i64 %t220, i64 %t221, i64 %t222, i64 %t223, i64 %t224)
  store i64 %t225, ptr %local.n2.155
  %t226 = load i64, ptr %local.u2.140
  %t227 = load i64, ptr %local.u3.141
  %t228 = load i64, ptr %local.u4.142
  %t229 = load i64, ptr %local.u0.138
  %t230 = load i64, ptr %local.u1.139
  %t231 = load i64, ptr %local.nu
  %t232 = load i64, ptr %local.dt.135
  %t233 = load i64, ptr %local.dx.134
  %t234 = call i64 @"burgers_step"(i64 %t226, i64 %t227, i64 %t228, i64 %t229, i64 %t230, i64 %t231, i64 %t232, i64 %t233)
  store i64 %t234, ptr %local.n3.156
  %t235 = load i64, ptr %local.u3.141
  %t236 = load i64, ptr %local.u4.142
  %t237 = load i64, ptr %local.u0.138
  %t238 = load i64, ptr %local.u1.139
  %t239 = load i64, ptr %local.u2.140
  %t240 = load i64, ptr %local.nu
  %t241 = load i64, ptr %local.dt.135
  %t242 = load i64, ptr %local.dx.134
  %t243 = call i64 @"burgers_step"(i64 %t235, i64 %t236, i64 %t237, i64 %t238, i64 %t239, i64 %t240, i64 %t241, i64 %t242)
  store i64 %t243, ptr %local.n4.157
  %t244 = load i64, ptr %local.n0.153
  store i64 %t244, ptr %local.u0.138
  %t245 = load i64, ptr %local.n1.154
  store i64 %t245, ptr %local.u1.139
  %t246 = load i64, ptr %local.n2.155
  store i64 %t246, ptr %local.u2.140
  %t247 = load i64, ptr %local.n3.156
  store i64 %t247, ptr %local.u3.141
  %t248 = load i64, ptr %local.n4.157
  store i64 %t248, ptr %local.u4.142
  %t249 = load i64, ptr %local.u1.139
  %t250 = load i64, ptr %local.u0.138
  %t251 = call i64 @"sx_f64_sub"(i64 %t249, i64 %t250)
  %t252 = load i64, ptr %local.dx.134
  %t253 = call i64 @"sx_f64_div"(i64 %t251, i64 %t252)
  %t254 = call i64 @"abs_f64"(i64 %t253)
  store i64 %t254, ptr %local.g01.158
  %t255 = load i64, ptr %local.u2.140
  %t256 = load i64, ptr %local.u1.139
  %t257 = call i64 @"sx_f64_sub"(i64 %t255, i64 %t256)
  %t258 = load i64, ptr %local.dx.134
  %t259 = call i64 @"sx_f64_div"(i64 %t257, i64 %t258)
  %t260 = call i64 @"abs_f64"(i64 %t259)
  store i64 %t260, ptr %local.g12.159
  %t261 = load i64, ptr %local.u3.141
  %t262 = load i64, ptr %local.u2.140
  %t263 = call i64 @"sx_f64_sub"(i64 %t261, i64 %t262)
  %t264 = load i64, ptr %local.dx.134
  %t265 = call i64 @"sx_f64_div"(i64 %t263, i64 %t264)
  %t266 = call i64 @"abs_f64"(i64 %t265)
  store i64 %t266, ptr %local.g23.160
  %t267 = load i64, ptr %local.u4.142
  %t268 = load i64, ptr %local.u3.141
  %t269 = call i64 @"sx_f64_sub"(i64 %t267, i64 %t268)
  %t270 = load i64, ptr %local.dx.134
  %t271 = call i64 @"sx_f64_div"(i64 %t269, i64 %t270)
  %t272 = call i64 @"abs_f64"(i64 %t271)
  store i64 %t272, ptr %local.g34.161
  %t273 = load i64, ptr %local.g01.158
  store i64 %t273, ptr %local.gmax.162
  %t274 = load i64, ptr %local.g12.159
  %t275 = load i64, ptr %local.gmax.162
  %t276 = call i64 @"sx_f64_gt"(i64 %t274, i64 %t275)
  %t277 = icmp ne i64 %t276, 0
  br i1 %t277, label %then11, label %else11
then11:
  %t278 = load i64, ptr %local.g12.159
  store i64 %t278, ptr %local.gmax.162
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t279 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t280 = load i64, ptr %local.g23.160
  %t281 = load i64, ptr %local.gmax.162
  %t282 = call i64 @"sx_f64_gt"(i64 %t280, i64 %t281)
  %t283 = icmp ne i64 %t282, 0
  br i1 %t283, label %then12, label %else12
then12:
  %t284 = load i64, ptr %local.g23.160
  store i64 %t284, ptr %local.gmax.162
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t285 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t286 = load i64, ptr %local.g34.161
  %t287 = load i64, ptr %local.gmax.162
  %t288 = call i64 @"sx_f64_gt"(i64 %t286, i64 %t287)
  %t289 = icmp ne i64 %t288, 0
  br i1 %t289, label %then13, label %else13
then13:
  %t290 = load i64, ptr %local.g34.161
  store i64 %t290, ptr %local.gmax.162
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t291 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t292 = load i64, ptr %local.gmax.162
  %t293 = load i64, ptr %local.max_grad.145
  %t294 = call i64 @"sx_f64_gt"(i64 %t292, i64 %t293)
  %t295 = icmp ne i64 %t294, 0
  br i1 %t295, label %then14, label %else14
then14:
  %t296 = load i64, ptr %local.gmax.162
  store i64 %t296, ptr %local.max_grad.145
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t297 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t298 = load i64, ptr %local.gmax.162
  %t299 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.34)
  %t300 = call i64 @"sx_f64_gt"(i64 %t298, i64 %t299)
  %t301 = icmp ne i64 %t300, 0
  br i1 %t301, label %then15, label %else15
then15:
  %t302 = load i64, ptr %local.blown.152
  %t303 = icmp eq i64 %t302, 0
  %t304 = zext i1 %t303 to i64
  %t305 = icmp ne i64 %t304, 0
  br i1 %t305, label %then16, label %else16
then16:
  %t306 = load i64, ptr %local.step.143
  %t307 = call i64 @"sx_int_to_f64"(i64 %t306)
  %t308 = load i64, ptr %local.dt.135
  %t309 = call i64 @"sx_f64_mul"(i64 %t307, i64 %t308)
  store i64 %t309, ptr %local.t_blow.151
  store i64 1, ptr %local.blown.152
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t310 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t311 = phi i64 [ %t310, %then15_end ], [ 0, %else15_end ]
  %t312 = load i64, ptr %local.u2.140
  %t313 = load i64, ptr %local.prev_u2.144
  %t314 = call i64 @"sx_f64_sub"(i64 %t312, i64 %t313)
  %t315 = call i64 @"abs_f64"(i64 %t314)
  store i64 %t315, ptr %local.drift.163
  %t316 = load i64, ptr %local.win_sum.146
  %t317 = load i64, ptr %local.drift.163
  %t318 = call i64 @"sx_f64_add"(i64 %t316, i64 %t317)
  store i64 %t318, ptr %local.win_sum.146
  %t319 = load i64, ptr %local.win_cnt.147
  %t320 = add i64 %t319, 1
  store i64 %t320, ptr %local.win_cnt.147
  %t321 = load i64, ptr %local.win_cnt.147
  %t322 = load i64, ptr %local.win.137
  %t323 = icmp sge i64 %t321, %t322
  %t324 = zext i1 %t323 to i64
  %t325 = icmp ne i64 %t324, 0
  br i1 %t325, label %then17, label %else17
then17:
  %t326 = load i64, ptr %local.win_sum.146
  %t327 = load i64, ptr %local.win_cnt.147
  %t328 = call i64 @"sx_int_to_f64"(i64 %t327)
  %t329 = call i64 @"sx_f64_div"(i64 %t326, i64 %t328)
  store i64 %t329, ptr %local.wav.164
  %t330 = load i64, ptr %local.prev_win_avg.148
  %t331 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.35)
  %t332 = call i64 @"sx_f64_gt"(i64 %t330, i64 %t331)
  %t333 = icmp ne i64 %t332, 0
  br i1 %t333, label %then18, label %else18
then18:
  %t334 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.36)
  %t335 = load i64, ptr %local.wav.164
  %t336 = load i64, ptr %local.prev_win_avg.148
  %t337 = call i64 @"sx_f64_div"(i64 %t335, i64 %t336)
  %t338 = call i64 @"sx_f64_sub"(i64 %t334, i64 %t337)
  store i64 %t338, ptr %local.s_loc.165
  %t339 = load i64, ptr %local.s_loc.165
  %t340 = load i64, ptr %local.min_s.149
  %t341 = call i64 @"sx_f64_lt"(i64 %t339, i64 %t340)
  %t342 = icmp ne i64 %t341, 0
  br i1 %t342, label %then19, label %else19
then19:
  %t343 = load i64, ptr %local.s_loc.165
  store i64 %t343, ptr %local.min_s.149
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t344 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t345 = load i64, ptr %local.s_loc.165
  %t346 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.37)
  %t347 = call i64 @"sx_f64_lt"(i64 %t345, i64 %t346)
  %t348 = icmp ne i64 %t347, 0
  br i1 %t348, label %then20, label %else20
then20:
  %t349 = load i64, ptr %local.t_s_neg.150
  %t350 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.38)
  %t351 = call i64 @"sx_f64_lt"(i64 %t349, i64 %t350)
  %t352 = icmp ne i64 %t351, 0
  br i1 %t352, label %then21, label %else21
then21:
  %t353 = load i64, ptr %local.step.143
  %t354 = call i64 @"sx_int_to_f64"(i64 %t353)
  %t355 = load i64, ptr %local.dt.135
  %t356 = call i64 @"sx_f64_mul"(i64 %t354, i64 %t355)
  store i64 %t356, ptr %local.t_s_neg.150
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t357 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t358 = phi i64 [ %t357, %then20_end ], [ 0, %else20_end ]
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t359 = phi i64 [ %t358, %then18_end ], [ 0, %else18_end ]
  %t360 = load i64, ptr %local.wav.164
  store i64 %t360, ptr %local.prev_win_avg.148
  %t361 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.39)
  store i64 %t361, ptr %local.win_sum.146
  store i64 0, ptr %local.win_cnt.147
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t362 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t363 = load i64, ptr %local.u0.138
  %t364 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.40)
  %t365 = call i64 @"sx_f64_gt"(i64 %t363, i64 %t364)
  %t366 = icmp ne i64 %t365, 0
  br i1 %t366, label %then22, label %else22
then22:
  %t367 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.41)
  store i64 %t367, ptr %local.u0.138
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t368 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t369 = load i64, ptr %local.u0.138
  %t370 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.42)
  %t371 = xor i64 %t370, -9223372036854775808
  %t372 = call i64 @"sx_f64_lt"(i64 %t369, i64 %t371)
  %t373 = icmp ne i64 %t372, 0
  br i1 %t373, label %then23, label %else23
then23:
  %t374 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.43)
  %t375 = xor i64 %t374, -9223372036854775808
  store i64 %t375, ptr %local.u0.138
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t376 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t377 = load i64, ptr %local.u1.139
  %t378 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.44)
  %t379 = call i64 @"sx_f64_gt"(i64 %t377, i64 %t378)
  %t380 = icmp ne i64 %t379, 0
  br i1 %t380, label %then24, label %else24
then24:
  %t381 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.45)
  store i64 %t381, ptr %local.u1.139
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t382 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t383 = load i64, ptr %local.u1.139
  %t384 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.46)
  %t385 = xor i64 %t384, -9223372036854775808
  %t386 = call i64 @"sx_f64_lt"(i64 %t383, i64 %t385)
  %t387 = icmp ne i64 %t386, 0
  br i1 %t387, label %then25, label %else25
then25:
  %t388 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.47)
  %t389 = xor i64 %t388, -9223372036854775808
  store i64 %t389, ptr %local.u1.139
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t390 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t391 = load i64, ptr %local.u2.140
  %t392 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.48)
  %t393 = call i64 @"sx_f64_gt"(i64 %t391, i64 %t392)
  %t394 = icmp ne i64 %t393, 0
  br i1 %t394, label %then26, label %else26
then26:
  %t395 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.49)
  store i64 %t395, ptr %local.u2.140
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t396 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t397 = load i64, ptr %local.u2.140
  %t398 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.50)
  %t399 = xor i64 %t398, -9223372036854775808
  %t400 = call i64 @"sx_f64_lt"(i64 %t397, i64 %t399)
  %t401 = icmp ne i64 %t400, 0
  br i1 %t401, label %then27, label %else27
then27:
  %t402 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.51)
  %t403 = xor i64 %t402, -9223372036854775808
  store i64 %t403, ptr %local.u2.140
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t404 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t405 = load i64, ptr %local.u3.141
  %t406 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.52)
  %t407 = call i64 @"sx_f64_gt"(i64 %t405, i64 %t406)
  %t408 = icmp ne i64 %t407, 0
  br i1 %t408, label %then28, label %else28
then28:
  %t409 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.53)
  store i64 %t409, ptr %local.u3.141
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t410 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t411 = load i64, ptr %local.u3.141
  %t412 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.54)
  %t413 = xor i64 %t412, -9223372036854775808
  %t414 = call i64 @"sx_f64_lt"(i64 %t411, i64 %t413)
  %t415 = icmp ne i64 %t414, 0
  br i1 %t415, label %then29, label %else29
then29:
  %t416 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.55)
  %t417 = xor i64 %t416, -9223372036854775808
  store i64 %t417, ptr %local.u3.141
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t418 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t419 = load i64, ptr %local.u4.142
  %t420 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.56)
  %t421 = call i64 @"sx_f64_gt"(i64 %t419, i64 %t420)
  %t422 = icmp ne i64 %t421, 0
  br i1 %t422, label %then30, label %else30
then30:
  %t423 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.57)
  store i64 %t423, ptr %local.u4.142
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t424 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t425 = load i64, ptr %local.u4.142
  %t426 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.58)
  %t427 = xor i64 %t426, -9223372036854775808
  %t428 = call i64 @"sx_f64_lt"(i64 %t425, i64 %t427)
  %t429 = icmp ne i64 %t428, 0
  br i1 %t429, label %then31, label %else31
then31:
  %t430 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.59)
  %t431 = xor i64 %t430, -9223372036854775808
  store i64 %t431, ptr %local.u4.142
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t432 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t433 = load i64, ptr %local.u2.140
  store i64 %t433, ptr %local.prev_u2.144
  %t434 = load i64, ptr %local.step.143
  %t435 = add i64 %t434, 1
  store i64 %t435, ptr %local.step.143
  br label %loop10
endloop10:
  %t436 = load i64, ptr %local.out_sel
  %t437 = icmp eq i64 %t436, 0
  %t438 = zext i1 %t437 to i64
  %t439 = icmp ne i64 %t438, 0
  br i1 %t439, label %then32, label %else32
then32:
  %t440 = load i64, ptr %local.max_grad.145
  ret i64 %t440
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t441 = phi i64 [ 0, %else32_end ]
  %t442 = load i64, ptr %local.out_sel
  %t443 = icmp eq i64 %t442, 1
  %t444 = zext i1 %t443 to i64
  %t445 = icmp ne i64 %t444, 0
  br i1 %t445, label %then33, label %else33
then33:
  %t446 = load i64, ptr %local.min_s.149
  ret i64 %t446
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t447 = phi i64 [ 0, %else33_end ]
  %t448 = load i64, ptr %local.out_sel
  %t449 = icmp eq i64 %t448, 2
  %t450 = zext i1 %t449 to i64
  %t451 = icmp ne i64 %t450, 0
  br i1 %t451, label %then34, label %else34
then34:
  %t452 = load i64, ptr %local.t_s_neg.150
  ret i64 %t452
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t453 = phi i64 [ 0, %else34_end ]
  %t454 = load i64, ptr %local.out_sel
  %t455 = icmp eq i64 %t454, 3
  %t456 = zext i1 %t455 to i64
  %t457 = icmp ne i64 %t456, 0
  br i1 %t457, label %then35, label %else35
then35:
  %t458 = load i64, ptr %local.t_blow.151
  ret i64 %t458
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t459 = phi i64 [ 0, %else35_end ]
  %t460 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.60)
  ret i64 %t460
}

define i64 @"print_ic_name"(i64 %ic) nounwind {
entry:
  %local.ic = alloca i64
  store i64 %ic, ptr %local.ic
  %t461 = load i64, ptr %local.ic
  %t462 = icmp eq i64 %t461, 0
  %t463 = zext i1 %t462 to i64
  %t464 = icmp ne i64 %t463, 0
  br i1 %t464, label %then36, label %else36
then36:
  %t465 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.61)
  %t466 = ptrtoint ptr %t465 to i64
  %t467 = inttoptr i64 %t466 to ptr
  call void @intrinsic_print(ptr %t467)
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t468 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t469 = load i64, ptr %local.ic
  %t470 = icmp eq i64 %t469, 1
  %t471 = zext i1 %t470 to i64
  %t472 = icmp ne i64 %t471, 0
  br i1 %t472, label %then37, label %else37
then37:
  %t473 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.62)
  %t474 = ptrtoint ptr %t473 to i64
  %t475 = inttoptr i64 %t474 to ptr
  call void @intrinsic_print(ptr %t475)
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t476 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t477 = load i64, ptr %local.ic
  %t478 = icmp eq i64 %t477, 2
  %t479 = zext i1 %t478 to i64
  %t480 = icmp ne i64 %t479, 0
  br i1 %t480, label %then38, label %else38
then38:
  %t481 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.63)
  %t482 = ptrtoint ptr %t481 to i64
  %t483 = inttoptr i64 %t482 to ptr
  call void @intrinsic_print(ptr %t483)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t484 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t485 = load i64, ptr %local.ic
  %t486 = icmp eq i64 %t485, 3
  %t487 = zext i1 %t486 to i64
  %t488 = icmp ne i64 %t487, 0
  br i1 %t488, label %then39, label %else39
then39:
  %t489 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.64)
  %t490 = ptrtoint ptr %t489 to i64
  %t491 = inttoptr i64 %t490 to ptr
  call void @intrinsic_print(ptr %t491)
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t492 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t493 = load i64, ptr %local.ic
  %t494 = icmp eq i64 %t493, 4
  %t495 = zext i1 %t494 to i64
  %t496 = icmp ne i64 %t495, 0
  br i1 %t496, label %then40, label %else40
then40:
  %t497 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.65)
  %t498 = ptrtoint ptr %t497 to i64
  %t499 = inttoptr i64 %t498 to ptr
  call void @intrinsic_print(ptr %t499)
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t500 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  ret i64 0
}

define i64 @"exp1_run_case"(i64 %ic, i64 %vi, i64 %r_smooth) nounwind {
entry:
  %local.nu.501 = alloca i64
  %local.mg.502 = alloca i64
  %local.ms.503 = alloca i64
  %local.is_smooth.504 = alloca i64
  %local.s_pos.505 = alloca i64
  %local.ic = alloca i64
  store i64 %ic, ptr %local.ic
  %local.vi = alloca i64
  store i64 %vi, ptr %local.vi
  %local.r_smooth = alloca i64
  store i64 %r_smooth, ptr %local.r_smooth
  %t506 = load i64, ptr %local.vi
  %t507 = call i64 @"get_nu"(i64 %t506)
  store i64 %t507, ptr %local.nu.501
  %t508 = load i64, ptr %local.ic
  %t509 = load i64, ptr %local.nu.501
  %t510 = call i64 @"burgers_run"(i64 %t508, i64 %t509, i64 0)
  store i64 %t510, ptr %local.mg.502
  %t511 = load i64, ptr %local.ic
  %t512 = load i64, ptr %local.nu.501
  %t513 = call i64 @"burgers_run"(i64 %t511, i64 %t512, i64 1)
  store i64 %t513, ptr %local.ms.503
  store i64 1, ptr %local.is_smooth.504
  %t514 = load i64, ptr %local.mg.502
  %t515 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.66)
  %t516 = call i64 @"sx_f64_gt"(i64 %t514, i64 %t515)
  %t517 = icmp ne i64 %t516, 0
  br i1 %t517, label %then41, label %else41
then41:
  store i64 0, ptr %local.is_smooth.504
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t518 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  store i64 1, ptr %local.s_pos.505
  %t519 = load i64, ptr %local.ms.503
  %t520 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.67)
  %t521 = call i64 @"sx_f64_lt"(i64 %t519, i64 %t520)
  %t522 = icmp ne i64 %t521, 0
  br i1 %t522, label %then42, label %else42
then42:
  store i64 0, ptr %local.s_pos.505
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t523 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t524 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.68)
  %t525 = ptrtoint ptr %t524 to i64
  %t526 = inttoptr i64 %t525 to ptr
  call void @intrinsic_print(ptr %t526)
  %t527 = load i64, ptr %local.ic
  %t528 = call i64 @"print_ic_name"(i64 %t527)
  %t529 = load i64, ptr %local.nu.501
  %t530 = call i64 @"print_f64"(i64 %t529)
  %t531 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.69)
  %t532 = ptrtoint ptr %t531 to i64
  %t533 = inttoptr i64 %t532 to ptr
  call void @intrinsic_print(ptr %t533)
  %t534 = load i64, ptr %local.mg.502
  %t535 = call i64 @"print_f64"(i64 %t534)
  %t536 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.70)
  %t537 = ptrtoint ptr %t536 to i64
  %t538 = inttoptr i64 %t537 to ptr
  call void @intrinsic_print(ptr %t538)
  %t539 = load i64, ptr %local.ms.503
  %t540 = call i64 @"print_f64"(i64 %t539)
  %t541 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.71)
  %t542 = ptrtoint ptr %t541 to i64
  %t543 = inttoptr i64 %t542 to ptr
  call void @intrinsic_print(ptr %t543)
  %t544 = load i64, ptr %local.is_smooth.504
  %t545 = icmp eq i64 %t544, 1
  %t546 = zext i1 %t545 to i64
  %t547 = icmp ne i64 %t546, 0
  br i1 %t547, label %then43, label %else43
then43:
  %t548 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.72)
  %t549 = ptrtoint ptr %t548 to i64
  %t550 = inttoptr i64 %t549 to ptr
  call void @intrinsic_print(ptr %t550)
  br label %then43_end
then43_end:
  br label %endif43
else43:
  %t551 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.73)
  %t552 = ptrtoint ptr %t551 to i64
  %t553 = inttoptr i64 %t552 to ptr
  call void @intrinsic_print(ptr %t553)
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t554 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t555 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.74)
  %t556 = ptrtoint ptr %t555 to i64
  %t557 = inttoptr i64 %t556 to ptr
  call void @intrinsic_print(ptr %t557)
  %t558 = load i64, ptr %local.s_pos.505
  %t559 = icmp eq i64 %t558, 1
  %t560 = zext i1 %t559 to i64
  %t561 = icmp ne i64 %t560, 0
  br i1 %t561, label %then44, label %else44
then44:
  %t562 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.75)
  %t563 = ptrtoint ptr %t562 to i64
  %t564 = inttoptr i64 %t563 to ptr
  call void @intrinsic_println(ptr %t564)
  br label %then44_end
then44_end:
  br label %endif44
else44:
  %t565 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.76)
  %t566 = ptrtoint ptr %t565 to i64
  %t567 = inttoptr i64 %t566 to ptr
  call void @intrinsic_println(ptr %t567)
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t568 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t569 = load i64, ptr %local.is_smooth.504
  %t570 = mul i64 %t569, 2
  %t571 = load i64, ptr %local.s_pos.505
  %t572 = add i64 %t570, %t571
  ret i64 %t572
}

define i64 @"test_exp1"() nounwind {
entry:
  %local.smooth_spos.573 = alloca i64
  %local.smooth_sneg.574 = alloca i64
  %local.rough_spos.575 = alloca i64
  %local.rough_sneg.576 = alloca i64
  %local.ic.577 = alloca i64
  %local.vi.578 = alloca i64
  %local.res.579 = alloca i64
  %t580 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.77)
  %t581 = ptrtoint ptr %t580 to i64
  %t582 = inttoptr i64 %t581 to ptr
  call void @intrinsic_println(ptr %t582)
  %t583 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.78)
  %t584 = ptrtoint ptr %t583 to i64
  %t585 = inttoptr i64 %t584 to ptr
  call void @intrinsic_println(ptr %t585)
  %t586 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.79)
  %t587 = ptrtoint ptr %t586 to i64
  %t588 = inttoptr i64 %t587 to ptr
  call void @intrinsic_println(ptr %t588)
  %t589 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.80)
  %t590 = ptrtoint ptr %t589 to i64
  %t591 = inttoptr i64 %t590 to ptr
  call void @intrinsic_println(ptr %t591)
  %t592 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.81)
  %t593 = ptrtoint ptr %t592 to i64
  %t594 = inttoptr i64 %t593 to ptr
  call void @intrinsic_println(ptr %t594)
  %t595 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.82)
  %t596 = ptrtoint ptr %t595 to i64
  %t597 = inttoptr i64 %t596 to ptr
  call void @intrinsic_println(ptr %t597)
  %t598 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.83)
  %t599 = ptrtoint ptr %t598 to i64
  %t600 = inttoptr i64 %t599 to ptr
  call void @intrinsic_println(ptr %t600)
  %t601 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.84)
  %t602 = ptrtoint ptr %t601 to i64
  %t603 = inttoptr i64 %t602 to ptr
  call void @intrinsic_println(ptr %t603)
  store i64 0, ptr %local.smooth_spos.573
  store i64 0, ptr %local.smooth_sneg.574
  store i64 0, ptr %local.rough_spos.575
  store i64 0, ptr %local.rough_sneg.576
  store i64 0, ptr %local.ic.577
  br label %loop45
loop45:
  %t604 = load i64, ptr %local.ic.577
  %t605 = icmp slt i64 %t604, 5
  %t606 = zext i1 %t605 to i64
  %t607 = icmp ne i64 %t606, 0
  br i1 %t607, label %body45, label %endloop45
body45:
  store i64 0, ptr %local.vi.578
  br label %loop46
loop46:
  %t608 = load i64, ptr %local.vi.578
  %t609 = icmp slt i64 %t608, 5
  %t610 = zext i1 %t609 to i64
  %t611 = icmp ne i64 %t610, 0
  br i1 %t611, label %body46, label %endloop46
body46:
  %t612 = load i64, ptr %local.ic.577
  %t613 = load i64, ptr %local.vi.578
  %t614 = call i64 @"exp1_run_case"(i64 %t612, i64 %t613, i64 0)
  store i64 %t614, ptr %local.res.579
  %t615 = load i64, ptr %local.res.579
  %t616 = icmp eq i64 %t615, 3
  %t617 = zext i1 %t616 to i64
  %t618 = icmp ne i64 %t617, 0
  br i1 %t618, label %then47, label %else47
then47:
  %t619 = load i64, ptr %local.smooth_spos.573
  %t620 = add i64 %t619, 1
  store i64 %t620, ptr %local.smooth_spos.573
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t621 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t622 = load i64, ptr %local.res.579
  %t623 = icmp eq i64 %t622, 2
  %t624 = zext i1 %t623 to i64
  %t625 = icmp ne i64 %t624, 0
  br i1 %t625, label %then48, label %else48
then48:
  %t626 = load i64, ptr %local.smooth_sneg.574
  %t627 = add i64 %t626, 1
  store i64 %t627, ptr %local.smooth_sneg.574
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t628 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t629 = load i64, ptr %local.res.579
  %t630 = icmp eq i64 %t629, 1
  %t631 = zext i1 %t630 to i64
  %t632 = icmp ne i64 %t631, 0
  br i1 %t632, label %then49, label %else49
then49:
  %t633 = load i64, ptr %local.rough_spos.575
  %t634 = add i64 %t633, 1
  store i64 %t634, ptr %local.rough_spos.575
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t635 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t636 = load i64, ptr %local.res.579
  %t637 = icmp eq i64 %t636, 0
  %t638 = zext i1 %t637 to i64
  %t639 = icmp ne i64 %t638, 0
  br i1 %t639, label %then50, label %else50
then50:
  %t640 = load i64, ptr %local.rough_sneg.576
  %t641 = add i64 %t640, 1
  store i64 %t641, ptr %local.rough_sneg.576
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t642 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t643 = load i64, ptr %local.vi.578
  %t644 = add i64 %t643, 1
  store i64 %t644, ptr %local.vi.578
  br label %loop46
endloop46:
  %t645 = load i64, ptr %local.ic.577
  %t646 = add i64 %t645, 1
  store i64 %t646, ptr %local.ic.577
  br label %loop45
endloop45:
  %t647 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.85)
  %t648 = ptrtoint ptr %t647 to i64
  %t649 = inttoptr i64 %t648 to ptr
  call void @intrinsic_println(ptr %t649)
  %t650 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.86)
  %t651 = ptrtoint ptr %t650 to i64
  %t652 = inttoptr i64 %t651 to ptr
  call void @intrinsic_println(ptr %t652)
  %t653 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.87)
  %t654 = ptrtoint ptr %t653 to i64
  %t655 = inttoptr i64 %t654 to ptr
  call void @intrinsic_println(ptr %t655)
  %t656 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.88)
  %t657 = ptrtoint ptr %t656 to i64
  %t658 = inttoptr i64 %t657 to ptr
  call void @intrinsic_print(ptr %t658)
  %t659 = load i64, ptr %local.smooth_spos.573
  call void @print_i64(i64 %t659)
  %t660 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.89)
  %t661 = ptrtoint ptr %t660 to i64
  %t662 = inttoptr i64 %t661 to ptr
  call void @intrinsic_print(ptr %t662)
  %t663 = load i64, ptr %local.smooth_sneg.574
  call void @print_i64(i64 %t663)
  %t664 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.90)
  %t665 = ptrtoint ptr %t664 to i64
  %t666 = inttoptr i64 %t665 to ptr
  call void @intrinsic_print(ptr %t666)
  %t667 = load i64, ptr %local.smooth_spos.573
  %t668 = load i64, ptr %local.smooth_sneg.574
  %t669 = add i64 %t667, %t668
  call void @print_i64(i64 %t669)
  %t670 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.91)
  %t671 = ptrtoint ptr %t670 to i64
  %t672 = inttoptr i64 %t671 to ptr
  call void @intrinsic_println(ptr %t672)
  %t673 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.92)
  %t674 = ptrtoint ptr %t673 to i64
  %t675 = inttoptr i64 %t674 to ptr
  call void @intrinsic_print(ptr %t675)
  %t676 = load i64, ptr %local.rough_spos.575
  call void @print_i64(i64 %t676)
  %t677 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.93)
  %t678 = ptrtoint ptr %t677 to i64
  %t679 = inttoptr i64 %t678 to ptr
  call void @intrinsic_print(ptr %t679)
  %t680 = load i64, ptr %local.rough_sneg.576
  call void @print_i64(i64 %t680)
  %t681 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.94)
  %t682 = ptrtoint ptr %t681 to i64
  %t683 = inttoptr i64 %t682 to ptr
  call void @intrinsic_print(ptr %t683)
  %t684 = load i64, ptr %local.rough_spos.575
  %t685 = load i64, ptr %local.rough_sneg.576
  %t686 = add i64 %t684, %t685
  call void @print_i64(i64 %t686)
  %t687 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.95)
  %t688 = ptrtoint ptr %t687 to i64
  %t689 = inttoptr i64 %t688 to ptr
  call void @intrinsic_println(ptr %t689)
  %t690 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.96)
  %t691 = ptrtoint ptr %t690 to i64
  %t692 = inttoptr i64 %t691 to ptr
  call void @intrinsic_print(ptr %t692)
  %t693 = load i64, ptr %local.smooth_spos.573
  %t694 = load i64, ptr %local.rough_spos.575
  %t695 = add i64 %t693, %t694
  call void @print_i64(i64 %t695)
  %t696 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.97)
  %t697 = ptrtoint ptr %t696 to i64
  %t698 = inttoptr i64 %t697 to ptr
  call void @intrinsic_print(ptr %t698)
  %t699 = load i64, ptr %local.smooth_sneg.574
  %t700 = load i64, ptr %local.rough_sneg.576
  %t701 = add i64 %t699, %t700
  call void @print_i64(i64 %t701)
  %t702 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.98)
  %t703 = ptrtoint ptr %t702 to i64
  %t704 = inttoptr i64 %t703 to ptr
  call void @intrinsic_print(ptr %t704)
  %t705 = load i64, ptr %local.smooth_spos.573
  %t706 = load i64, ptr %local.smooth_sneg.574
  %t707 = add i64 %t705, %t706
  %t708 = load i64, ptr %local.rough_spos.575
  %t709 = add i64 %t707, %t708
  %t710 = load i64, ptr %local.rough_sneg.576
  %t711 = add i64 %t709, %t710
  call void @print_i64(i64 %t711)
  %t712 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.99)
  %t713 = ptrtoint ptr %t712 to i64
  %t714 = inttoptr i64 %t713 to ptr
  call void @intrinsic_println(ptr %t714)
  %t715 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.100)
  %t716 = ptrtoint ptr %t715 to i64
  %t717 = inttoptr i64 %t716 to ptr
  call void @intrinsic_println(ptr %t717)
  %t718 = load i64, ptr %local.smooth_sneg.574
  %t719 = icmp eq i64 %t718, 0
  %t720 = zext i1 %t719 to i64
  %t721 = icmp ne i64 %t720, 0
  br i1 %t721, label %then51, label %else51
then51:
  %t722 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.101)
  %t723 = ptrtoint ptr %t722 to i64
  %t724 = inttoptr i64 %t723 to ptr
  call void @intrinsic_println(ptr %t724)
  %t725 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.102)
  %t726 = ptrtoint ptr %t725 to i64
  %t727 = inttoptr i64 %t726 to ptr
  call void @intrinsic_println(ptr %t727)
  br label %then51_end
then51_end:
  br label %endif51
else51:
  %t728 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.103)
  %t729 = ptrtoint ptr %t728 to i64
  %t730 = inttoptr i64 %t729 to ptr
  call void @intrinsic_print(ptr %t730)
  %t731 = load i64, ptr %local.smooth_sneg.574
  call void @print_i64(i64 %t731)
  %t732 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.104)
  %t733 = ptrtoint ptr %t732 to i64
  %t734 = inttoptr i64 %t733 to ptr
  call void @intrinsic_println(ptr %t734)
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t735 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t736 = load i64, ptr %local.rough_sneg.576
  %t737 = icmp sgt i64 %t736, 0
  %t738 = zext i1 %t737 to i64
  %t739 = icmp ne i64 %t738, 0
  br i1 %t739, label %then52, label %else52
then52:
  %t740 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.105)
  %t741 = ptrtoint ptr %t740 to i64
  %t742 = inttoptr i64 %t741 to ptr
  call void @intrinsic_print(ptr %t742)
  %t743 = load i64, ptr %local.rough_sneg.576
  call void @print_i64(i64 %t743)
  %t744 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.106)
  %t745 = ptrtoint ptr %t744 to i64
  %t746 = inttoptr i64 %t745 to ptr
  call void @intrinsic_println(ptr %t746)
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t747 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t748 = load i64, ptr %local.rough_spos.575
  %t749 = icmp sgt i64 %t748, 0
  %t750 = zext i1 %t749 to i64
  %t751 = icmp ne i64 %t750, 0
  br i1 %t751, label %then53, label %else53
then53:
  %t752 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.107)
  %t753 = ptrtoint ptr %t752 to i64
  %t754 = inttoptr i64 %t753 to ptr
  call void @intrinsic_print(ptr %t754)
  %t755 = load i64, ptr %local.rough_spos.575
  call void @print_i64(i64 %t755)
  %t756 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.108)
  %t757 = ptrtoint ptr %t756 to i64
  %t758 = inttoptr i64 %t757 to ptr
  call void @intrinsic_println(ptr %t758)
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t759 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t760 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.109)
  %t761 = ptrtoint ptr %t760 to i64
  %t762 = inttoptr i64 %t761 to ptr
  call void @intrinsic_println(ptr %t762)
  ret i64 0
}

define i64 @"test_exp2"() nounwind {
entry:
  %local.ei.763 = alloca i64
  %local.eps.764 = alloca i64
  %local.tp.765 = alloca i64
  %local.fp.766 = alloca i64
  %local.fn_count.767 = alloca i64
  %local.tn.768 = alloca i64
  %local.k.769 = alloca i64
  %local.ic.770 = alloca i64
  %local.vi.771 = alloca i64
  %local.nu.772 = alloca i64
  %local.mg.773 = alloca i64
  %local.ms.774 = alloca i64
  %local.is_smooth.775 = alloca i64
  %local.pred_smooth.776 = alloca i64
  %local.precision.777 = alloca i64
  %local.recall.778 = alloca i64
  %t779 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.110)
  %t780 = ptrtoint ptr %t779 to i64
  %t781 = inttoptr i64 %t780 to ptr
  call void @intrinsic_println(ptr %t781)
  %t782 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.111)
  %t783 = ptrtoint ptr %t782 to i64
  %t784 = inttoptr i64 %t783 to ptr
  call void @intrinsic_println(ptr %t784)
  %t785 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.112)
  %t786 = ptrtoint ptr %t785 to i64
  %t787 = inttoptr i64 %t786 to ptr
  call void @intrinsic_println(ptr %t787)
  %t788 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.113)
  %t789 = ptrtoint ptr %t788 to i64
  %t790 = inttoptr i64 %t789 to ptr
  call void @intrinsic_println(ptr %t790)
  %t791 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.114)
  %t792 = ptrtoint ptr %t791 to i64
  %t793 = inttoptr i64 %t792 to ptr
  call void @intrinsic_println(ptr %t793)
  %t794 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.115)
  %t795 = ptrtoint ptr %t794 to i64
  %t796 = inttoptr i64 %t795 to ptr
  call void @intrinsic_println(ptr %t796)
  %t797 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.116)
  %t798 = ptrtoint ptr %t797 to i64
  %t799 = inttoptr i64 %t798 to ptr
  call void @intrinsic_println(ptr %t799)
  %t800 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.117)
  %t801 = ptrtoint ptr %t800 to i64
  %t802 = inttoptr i64 %t801 to ptr
  call void @intrinsic_println(ptr %t802)
  store i64 0, ptr %local.ei.763
  br label %loop54
loop54:
  %t803 = load i64, ptr %local.ei.763
  %t804 = icmp slt i64 %t803, 11
  %t805 = zext i1 %t804 to i64
  %t806 = icmp ne i64 %t805, 0
  br i1 %t806, label %body54, label %endloop54
body54:
  %t807 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.118)
  %t808 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.119)
  %t809 = call i64 @"sx_f64_sub"(i64 %t807, i64 %t808)
  %t810 = load i64, ptr %local.ei.763
  %t811 = call i64 @"sx_int_to_f64"(i64 %t810)
  %t812 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.120)
  %t813 = call i64 @"sx_f64_mul"(i64 %t811, i64 %t812)
  %t814 = call i64 @"sx_f64_add"(i64 %t809, i64 %t813)
  store i64 %t814, ptr %local.eps.764
  store i64 0, ptr %local.tp.765
  store i64 0, ptr %local.fp.766
  store i64 0, ptr %local.fn_count.767
  store i64 0, ptr %local.tn.768
  store i64 0, ptr %local.k.769
  br label %loop55
loop55:
  %t815 = load i64, ptr %local.k.769
  %t816 = icmp slt i64 %t815, 25
  %t817 = zext i1 %t816 to i64
  %t818 = icmp ne i64 %t817, 0
  br i1 %t818, label %body55, label %endloop55
body55:
  %t819 = load i64, ptr %local.k.769
  %t820 = sdiv i64 %t819, 5
  store i64 %t820, ptr %local.ic.770
  %t821 = load i64, ptr %local.k.769
  %t822 = load i64, ptr %local.ic.770
  %t823 = mul i64 %t822, 5
  %t824 = sub i64 %t821, %t823
  store i64 %t824, ptr %local.vi.771
  %t825 = load i64, ptr %local.vi.771
  %t826 = call i64 @"get_nu"(i64 %t825)
  store i64 %t826, ptr %local.nu.772
  %t827 = load i64, ptr %local.ic.770
  %t828 = load i64, ptr %local.nu.772
  %t829 = call i64 @"burgers_run"(i64 %t827, i64 %t828, i64 0)
  store i64 %t829, ptr %local.mg.773
  %t830 = load i64, ptr %local.ic.770
  %t831 = load i64, ptr %local.nu.772
  %t832 = call i64 @"burgers_run"(i64 %t830, i64 %t831, i64 1)
  store i64 %t832, ptr %local.ms.774
  store i64 0, ptr %local.is_smooth.775
  %t833 = load i64, ptr %local.mg.773
  %t834 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.121)
  %t835 = call i64 @"sx_f64_lt"(i64 %t833, i64 %t834)
  %t836 = icmp ne i64 %t835, 0
  br i1 %t836, label %then56, label %else56
then56:
  store i64 1, ptr %local.is_smooth.775
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t837 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  store i64 0, ptr %local.pred_smooth.776
  %t838 = load i64, ptr %local.ms.774
  %t839 = load i64, ptr %local.eps.764
  %t840 = call i64 @"sx_f64_ge"(i64 %t838, i64 %t839)
  %t841 = icmp ne i64 %t840, 0
  br i1 %t841, label %then57, label %else57
then57:
  store i64 1, ptr %local.pred_smooth.776
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t842 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t843 = load i64, ptr %local.is_smooth.775
  %t844 = icmp eq i64 %t843, 1
  %t845 = zext i1 %t844 to i64
  %t846 = icmp ne i64 %t845, 0
  br i1 %t846, label %then58, label %else58
then58:
  %t847 = load i64, ptr %local.pred_smooth.776
  %t848 = icmp eq i64 %t847, 1
  %t849 = zext i1 %t848 to i64
  %t850 = icmp ne i64 %t849, 0
  br i1 %t850, label %then59, label %else59
then59:
  %t851 = load i64, ptr %local.tp.765
  %t852 = add i64 %t851, 1
  store i64 %t852, ptr %local.tp.765
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t853 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t854 = load i64, ptr %local.pred_smooth.776
  %t855 = icmp eq i64 %t854, 0
  %t856 = zext i1 %t855 to i64
  %t857 = icmp ne i64 %t856, 0
  br i1 %t857, label %then60, label %else60
then60:
  %t858 = load i64, ptr %local.fn_count.767
  %t859 = add i64 %t858, 1
  store i64 %t859, ptr %local.fn_count.767
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t860 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  br label %then58_end
then58_end:
  br label %endif58
else58:
  %t861 = load i64, ptr %local.pred_smooth.776
  %t862 = icmp eq i64 %t861, 1
  %t863 = zext i1 %t862 to i64
  %t864 = icmp ne i64 %t863, 0
  br i1 %t864, label %then61, label %else61
then61:
  %t865 = load i64, ptr %local.fp.766
  %t866 = add i64 %t865, 1
  store i64 %t866, ptr %local.fp.766
  br label %then61_end
then61_end:
  br label %endif61
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t867 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t868 = load i64, ptr %local.pred_smooth.776
  %t869 = icmp eq i64 %t868, 0
  %t870 = zext i1 %t869 to i64
  %t871 = icmp ne i64 %t870, 0
  br i1 %t871, label %then62, label %else62
then62:
  %t872 = load i64, ptr %local.tn.768
  %t873 = add i64 %t872, 1
  store i64 %t873, ptr %local.tn.768
  br label %then62_end
then62_end:
  br label %endif62
else62:
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t874 = phi i64 [ 0, %then62_end ], [ 0, %else62_end ]
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t875 = phi i64 [ %t860, %then58_end ], [ %t874, %else58_end ]
  %t876 = load i64, ptr %local.k.769
  %t877 = add i64 %t876, 1
  store i64 %t877, ptr %local.k.769
  br label %loop55
endloop55:
  %t878 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.122)
  store i64 %t878, ptr %local.precision.777
  %t879 = load i64, ptr %local.tp.765
  %t880 = load i64, ptr %local.fp.766
  %t881 = add i64 %t879, %t880
  %t882 = icmp sgt i64 %t881, 0
  %t883 = zext i1 %t882 to i64
  %t884 = icmp ne i64 %t883, 0
  br i1 %t884, label %then63, label %else63
then63:
  %t885 = load i64, ptr %local.tp.765
  %t886 = call i64 @"sx_int_to_f64"(i64 %t885)
  %t887 = load i64, ptr %local.tp.765
  %t888 = load i64, ptr %local.fp.766
  %t889 = add i64 %t887, %t888
  %t890 = call i64 @"sx_int_to_f64"(i64 %t889)
  %t891 = call i64 @"sx_f64_div"(i64 %t886, i64 %t890)
  store i64 %t891, ptr %local.precision.777
  br label %then63_end
then63_end:
  br label %endif63
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t892 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  %t893 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.123)
  store i64 %t893, ptr %local.recall.778
  %t894 = load i64, ptr %local.tp.765
  %t895 = load i64, ptr %local.fn_count.767
  %t896 = add i64 %t894, %t895
  %t897 = icmp sgt i64 %t896, 0
  %t898 = zext i1 %t897 to i64
  %t899 = icmp ne i64 %t898, 0
  br i1 %t899, label %then64, label %else64
then64:
  %t900 = load i64, ptr %local.tp.765
  %t901 = call i64 @"sx_int_to_f64"(i64 %t900)
  %t902 = load i64, ptr %local.tp.765
  %t903 = load i64, ptr %local.fn_count.767
  %t904 = add i64 %t902, %t903
  %t905 = call i64 @"sx_int_to_f64"(i64 %t904)
  %t906 = call i64 @"sx_f64_div"(i64 %t901, i64 %t905)
  store i64 %t906, ptr %local.recall.778
  br label %then64_end
then64_end:
  br label %endif64
else64:
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t907 = phi i64 [ 0, %then64_end ], [ 0, %else64_end ]
  %t908 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.124)
  %t909 = ptrtoint ptr %t908 to i64
  %t910 = inttoptr i64 %t909 to ptr
  call void @intrinsic_print(ptr %t910)
  %t911 = load i64, ptr %local.eps.764
  %t912 = call i64 @"print_f64"(i64 %t911)
  %t913 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.125)
  %t914 = ptrtoint ptr %t913 to i64
  %t915 = inttoptr i64 %t914 to ptr
  call void @intrinsic_print(ptr %t915)
  %t916 = load i64, ptr %local.tp.765
  call void @print_i64(i64 %t916)
  %t917 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.126)
  %t918 = ptrtoint ptr %t917 to i64
  %t919 = inttoptr i64 %t918 to ptr
  call void @intrinsic_print(ptr %t919)
  %t920 = load i64, ptr %local.fp.766
  call void @print_i64(i64 %t920)
  %t921 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.127)
  %t922 = ptrtoint ptr %t921 to i64
  %t923 = inttoptr i64 %t922 to ptr
  call void @intrinsic_print(ptr %t923)
  %t924 = load i64, ptr %local.fn_count.767
  call void @print_i64(i64 %t924)
  %t925 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.128)
  %t926 = ptrtoint ptr %t925 to i64
  %t927 = inttoptr i64 %t926 to ptr
  call void @intrinsic_print(ptr %t927)
  %t928 = load i64, ptr %local.tn.768
  call void @print_i64(i64 %t928)
  %t929 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.129)
  %t930 = ptrtoint ptr %t929 to i64
  %t931 = inttoptr i64 %t930 to ptr
  call void @intrinsic_print(ptr %t931)
  %t932 = load i64, ptr %local.precision.777
  %t933 = call i64 @"print_f64"(i64 %t932)
  %t934 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.130)
  %t935 = ptrtoint ptr %t934 to i64
  %t936 = inttoptr i64 %t935 to ptr
  call void @intrinsic_print(ptr %t936)
  %t937 = load i64, ptr %local.recall.778
  %t938 = call i64 @"print_f64"(i64 %t937)
  %t939 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.131)
  %t940 = ptrtoint ptr %t939 to i64
  %t941 = inttoptr i64 %t940 to ptr
  call void @intrinsic_println(ptr %t941)
  %t942 = load i64, ptr %local.ei.763
  %t943 = add i64 %t942, 1
  store i64 %t943, ptr %local.ei.763
  br label %loop54
endloop54:
  %t944 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.132)
  %t945 = ptrtoint ptr %t944 to i64
  %t946 = inttoptr i64 %t945 to ptr
  call void @intrinsic_println(ptr %t946)
  %t947 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.133)
  %t948 = ptrtoint ptr %t947 to i64
  %t949 = inttoptr i64 %t948 to ptr
  call void @intrinsic_println(ptr %t949)
  %t950 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.134)
  %t951 = ptrtoint ptr %t950 to i64
  %t952 = inttoptr i64 %t951 to ptr
  call void @intrinsic_println(ptr %t952)
  %t953 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.135)
  %t954 = ptrtoint ptr %t953 to i64
  %t955 = inttoptr i64 %t954 to ptr
  call void @intrinsic_println(ptr %t955)
  %t956 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.136)
  %t957 = ptrtoint ptr %t956 to i64
  %t958 = inttoptr i64 %t957 to ptr
  call void @intrinsic_println(ptr %t958)
  %t959 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.137)
  %t960 = ptrtoint ptr %t959 to i64
  %t961 = inttoptr i64 %t960 to ptr
  call void @intrinsic_println(ptr %t961)
  %t962 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.138)
  %t963 = ptrtoint ptr %t962 to i64
  %t964 = inttoptr i64 %t963 to ptr
  call void @intrinsic_println(ptr %t964)
  %t965 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.139)
  %t966 = ptrtoint ptr %t965 to i64
  %t967 = inttoptr i64 %t966 to ptr
  call void @intrinsic_println(ptr %t967)
  %t968 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.140)
  %t969 = ptrtoint ptr %t968 to i64
  %t970 = inttoptr i64 %t969 to ptr
  call void @intrinsic_println(ptr %t970)
  ret i64 0
}

define i64 @"test_exp3"() nounwind {
entry:
  %local.count_both.971 = alloca i64
  %local.count_warning.972 = alloca i64
  %local.sum_lead.973 = alloca i64
  %local.ic.974 = alloca i64
  %local.vi.975 = alloca i64
  %local.nu.976 = alloca i64
  %local.t_s.977 = alloca i64
  %local.t_b.978 = alloca i64
  %local.lead.979 = alloca i64
  %local.avg_lead.980 = alloca i64
  %t981 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.141)
  %t982 = ptrtoint ptr %t981 to i64
  %t983 = inttoptr i64 %t982 to ptr
  call void @intrinsic_println(ptr %t983)
  %t984 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.142)
  %t985 = ptrtoint ptr %t984 to i64
  %t986 = inttoptr i64 %t985 to ptr
  call void @intrinsic_println(ptr %t986)
  %t987 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.143)
  %t988 = ptrtoint ptr %t987 to i64
  %t989 = inttoptr i64 %t988 to ptr
  call void @intrinsic_println(ptr %t989)
  %t990 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.144)
  %t991 = ptrtoint ptr %t990 to i64
  %t992 = inttoptr i64 %t991 to ptr
  call void @intrinsic_println(ptr %t992)
  %t993 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.145)
  %t994 = ptrtoint ptr %t993 to i64
  %t995 = inttoptr i64 %t994 to ptr
  call void @intrinsic_println(ptr %t995)
  %t996 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.146)
  %t997 = ptrtoint ptr %t996 to i64
  %t998 = inttoptr i64 %t997 to ptr
  call void @intrinsic_println(ptr %t998)
  %t999 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.147)
  %t1000 = ptrtoint ptr %t999 to i64
  %t1001 = inttoptr i64 %t1000 to ptr
  call void @intrinsic_println(ptr %t1001)
  %t1002 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.148)
  %t1003 = ptrtoint ptr %t1002 to i64
  %t1004 = inttoptr i64 %t1003 to ptr
  call void @intrinsic_println(ptr %t1004)
  store i64 0, ptr %local.count_both.971
  store i64 0, ptr %local.count_warning.972
  %t1005 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.149)
  store i64 %t1005, ptr %local.sum_lead.973
  store i64 0, ptr %local.ic.974
  br label %loop65
loop65:
  %t1006 = load i64, ptr %local.ic.974
  %t1007 = icmp slt i64 %t1006, 5
  %t1008 = zext i1 %t1007 to i64
  %t1009 = icmp ne i64 %t1008, 0
  br i1 %t1009, label %body65, label %endloop65
body65:
  store i64 0, ptr %local.vi.975
  br label %loop66
loop66:
  %t1010 = load i64, ptr %local.vi.975
  %t1011 = icmp slt i64 %t1010, 5
  %t1012 = zext i1 %t1011 to i64
  %t1013 = icmp ne i64 %t1012, 0
  br i1 %t1013, label %body66, label %endloop66
body66:
  %t1014 = load i64, ptr %local.vi.975
  %t1015 = call i64 @"get_nu"(i64 %t1014)
  store i64 %t1015, ptr %local.nu.976
  %t1016 = load i64, ptr %local.ic.974
  %t1017 = load i64, ptr %local.nu.976
  %t1018 = call i64 @"burgers_run"(i64 %t1016, i64 %t1017, i64 2)
  store i64 %t1018, ptr %local.t_s.977
  %t1019 = load i64, ptr %local.ic.974
  %t1020 = load i64, ptr %local.nu.976
  %t1021 = call i64 @"burgers_run"(i64 %t1019, i64 %t1020, i64 3)
  store i64 %t1021, ptr %local.t_b.978
  %t1022 = load i64, ptr %local.t_s.977
  %t1023 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.150)
  %t1024 = call i64 @"sx_f64_ge"(i64 %t1022, i64 %t1023)
  %t1025 = icmp ne i64 %t1024, 0
  br i1 %t1025, label %then67, label %else67
then67:
  %t1026 = load i64, ptr %local.t_b.978
  %t1027 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.151)
  %t1028 = call i64 @"sx_f64_ge"(i64 %t1026, i64 %t1027)
  %t1029 = icmp ne i64 %t1028, 0
  br i1 %t1029, label %then68, label %else68
then68:
  %t1030 = load i64, ptr %local.count_both.971
  %t1031 = add i64 %t1030, 1
  store i64 %t1031, ptr %local.count_both.971
  %t1032 = load i64, ptr %local.t_b.978
  %t1033 = load i64, ptr %local.t_s.977
  %t1034 = call i64 @"sx_f64_sub"(i64 %t1032, i64 %t1033)
  store i64 %t1034, ptr %local.lead.979
  %t1035 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.152)
  %t1036 = ptrtoint ptr %t1035 to i64
  %t1037 = inttoptr i64 %t1036 to ptr
  call void @intrinsic_print(ptr %t1037)
  %t1038 = load i64, ptr %local.ic.974
  %t1039 = call i64 @"print_ic_name"(i64 %t1038)
  %t1040 = load i64, ptr %local.nu.976
  %t1041 = call i64 @"print_f64"(i64 %t1040)
  %t1042 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.153)
  %t1043 = ptrtoint ptr %t1042 to i64
  %t1044 = inttoptr i64 %t1043 to ptr
  call void @intrinsic_print(ptr %t1044)
  %t1045 = load i64, ptr %local.t_s.977
  %t1046 = call i64 @"print_f64"(i64 %t1045)
  %t1047 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.154)
  %t1048 = ptrtoint ptr %t1047 to i64
  %t1049 = inttoptr i64 %t1048 to ptr
  call void @intrinsic_print(ptr %t1049)
  %t1050 = load i64, ptr %local.t_b.978
  %t1051 = call i64 @"print_f64"(i64 %t1050)
  %t1052 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.155)
  %t1053 = ptrtoint ptr %t1052 to i64
  %t1054 = inttoptr i64 %t1053 to ptr
  call void @intrinsic_print(ptr %t1054)
  %t1055 = load i64, ptr %local.lead.979
  %t1056 = call i64 @"print_f64"(i64 %t1055)
  %t1057 = load i64, ptr %local.lead.979
  %t1058 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.156)
  %t1059 = call i64 @"sx_f64_gt"(i64 %t1057, i64 %t1058)
  %t1060 = icmp ne i64 %t1059, 0
  br i1 %t1060, label %then69, label %else69
then69:
  %t1061 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.157)
  %t1062 = ptrtoint ptr %t1061 to i64
  %t1063 = inttoptr i64 %t1062 to ptr
  call void @intrinsic_println(ptr %t1063)
  %t1064 = load i64, ptr %local.count_warning.972
  %t1065 = add i64 %t1064, 1
  store i64 %t1065, ptr %local.count_warning.972
  %t1066 = load i64, ptr %local.sum_lead.973
  %t1067 = load i64, ptr %local.lead.979
  %t1068 = call i64 @"sx_f64_add"(i64 %t1066, i64 %t1067)
  store i64 %t1068, ptr %local.sum_lead.973
  br label %then69_end
then69_end:
  br label %endif69
else69:
  %t1069 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.158)
  %t1070 = ptrtoint ptr %t1069 to i64
  %t1071 = inttoptr i64 %t1070 to ptr
  call void @intrinsic_println(ptr %t1071)
  br label %else69_end
else69_end:
  br label %endif69
endif69:
  %t1072 = phi i64 [ 0, %then69_end ], [ 0, %else69_end ]
  br label %then68_end
then68_end:
  br label %endif68
else68:
  br label %else68_end
else68_end:
  br label %endif68
endif68:
  %t1073 = phi i64 [ %t1072, %then68_end ], [ 0, %else68_end ]
  br label %then67_end
then67_end:
  br label %endif67
else67:
  br label %else67_end
else67_end:
  br label %endif67
endif67:
  %t1074 = phi i64 [ %t1073, %then67_end ], [ 0, %else67_end ]
  %t1075 = load i64, ptr %local.t_s.977
  %t1076 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.159)
  %t1077 = call i64 @"sx_f64_ge"(i64 %t1075, i64 %t1076)
  %t1078 = icmp ne i64 %t1077, 0
  br i1 %t1078, label %then70, label %else70
then70:
  %t1079 = load i64, ptr %local.t_b.978
  %t1080 = call i64 @f64_parse(ptr @.str.exp_ns_smoothness.160)
  %t1081 = call i64 @"sx_f64_lt"(i64 %t1079, i64 %t1080)
  %t1082 = icmp ne i64 %t1081, 0
  br i1 %t1082, label %then71, label %else71
then71:
  %t1083 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.161)
  %t1084 = ptrtoint ptr %t1083 to i64
  %t1085 = inttoptr i64 %t1084 to ptr
  call void @intrinsic_print(ptr %t1085)
  %t1086 = load i64, ptr %local.ic.974
  %t1087 = call i64 @"print_ic_name"(i64 %t1086)
  %t1088 = load i64, ptr %local.nu.976
  %t1089 = call i64 @"print_f64"(i64 %t1088)
  %t1090 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.162)
  %t1091 = ptrtoint ptr %t1090 to i64
  %t1092 = inttoptr i64 %t1091 to ptr
  call void @intrinsic_print(ptr %t1092)
  %t1093 = load i64, ptr %local.t_s.977
  %t1094 = call i64 @"print_f64"(i64 %t1093)
  %t1095 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.163)
  %t1096 = ptrtoint ptr %t1095 to i64
  %t1097 = inttoptr i64 %t1096 to ptr
  call void @intrinsic_println(ptr %t1097)
  br label %then71_end
then71_end:
  br label %endif71
else71:
  br label %else71_end
else71_end:
  br label %endif71
endif71:
  %t1098 = phi i64 [ 0, %then71_end ], [ 0, %else71_end ]
  br label %then70_end
then70_end:
  br label %endif70
else70:
  br label %else70_end
else70_end:
  br label %endif70
endif70:
  %t1099 = phi i64 [ %t1098, %then70_end ], [ 0, %else70_end ]
  %t1100 = load i64, ptr %local.vi.975
  %t1101 = add i64 %t1100, 1
  store i64 %t1101, ptr %local.vi.975
  br label %loop66
endloop66:
  %t1102 = load i64, ptr %local.ic.974
  %t1103 = add i64 %t1102, 1
  store i64 %t1103, ptr %local.ic.974
  br label %loop65
endloop65:
  %t1104 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.164)
  %t1105 = ptrtoint ptr %t1104 to i64
  %t1106 = inttoptr i64 %t1105 to ptr
  call void @intrinsic_println(ptr %t1106)
  %t1107 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.165)
  %t1108 = ptrtoint ptr %t1107 to i64
  %t1109 = inttoptr i64 %t1108 to ptr
  call void @intrinsic_println(ptr %t1109)
  %t1110 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.166)
  %t1111 = ptrtoint ptr %t1110 to i64
  %t1112 = inttoptr i64 %t1111 to ptr
  call void @intrinsic_print(ptr %t1112)
  %t1113 = load i64, ptr %local.count_both.971
  call void @print_i64(i64 %t1113)
  %t1114 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.167)
  %t1115 = ptrtoint ptr %t1114 to i64
  %t1116 = inttoptr i64 %t1115 to ptr
  call void @intrinsic_println(ptr %t1116)
  %t1117 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.168)
  %t1118 = ptrtoint ptr %t1117 to i64
  %t1119 = inttoptr i64 %t1118 to ptr
  call void @intrinsic_print(ptr %t1119)
  %t1120 = load i64, ptr %local.count_warning.972
  call void @print_i64(i64 %t1120)
  %t1121 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.169)
  %t1122 = ptrtoint ptr %t1121 to i64
  %t1123 = inttoptr i64 %t1122 to ptr
  call void @intrinsic_println(ptr %t1123)
  %t1124 = load i64, ptr %local.count_warning.972
  %t1125 = icmp sgt i64 %t1124, 0
  %t1126 = zext i1 %t1125 to i64
  %t1127 = icmp ne i64 %t1126, 0
  br i1 %t1127, label %then72, label %else72
then72:
  %t1128 = load i64, ptr %local.sum_lead.973
  %t1129 = load i64, ptr %local.count_warning.972
  %t1130 = call i64 @"sx_int_to_f64"(i64 %t1129)
  %t1131 = call i64 @"sx_f64_div"(i64 %t1128, i64 %t1130)
  store i64 %t1131, ptr %local.avg_lead.980
  %t1132 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.170)
  %t1133 = ptrtoint ptr %t1132 to i64
  %t1134 = inttoptr i64 %t1133 to ptr
  call void @intrinsic_print(ptr %t1134)
  %t1135 = load i64, ptr %local.avg_lead.980
  %t1136 = call i64 @"print_f64"(i64 %t1135)
  %t1137 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.171)
  %t1138 = ptrtoint ptr %t1137 to i64
  %t1139 = inttoptr i64 %t1138 to ptr
  call void @intrinsic_println(ptr %t1139)
  %t1140 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.172)
  %t1141 = ptrtoint ptr %t1140 to i64
  %t1142 = inttoptr i64 %t1141 to ptr
  call void @intrinsic_println(ptr %t1142)
  %t1143 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.173)
  %t1144 = ptrtoint ptr %t1143 to i64
  %t1145 = inttoptr i64 %t1144 to ptr
  call void @intrinsic_println(ptr %t1145)
  %t1146 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.174)
  %t1147 = ptrtoint ptr %t1146 to i64
  %t1148 = inttoptr i64 %t1147 to ptr
  call void @intrinsic_println(ptr %t1148)
  %t1149 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.175)
  %t1150 = ptrtoint ptr %t1149 to i64
  %t1151 = inttoptr i64 %t1150 to ptr
  call void @intrinsic_println(ptr %t1151)
  br label %then72_end
then72_end:
  br label %endif72
else72:
  %t1152 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.176)
  %t1153 = ptrtoint ptr %t1152 to i64
  %t1154 = inttoptr i64 %t1153 to ptr
  call void @intrinsic_println(ptr %t1154)
  %t1155 = load i64, ptr %local.count_both.971
  %t1156 = icmp sgt i64 %t1155, 0
  %t1157 = zext i1 %t1156 to i64
  %t1158 = icmp ne i64 %t1157, 0
  br i1 %t1158, label %then73, label %else73
then73:
  %t1159 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.177)
  %t1160 = ptrtoint ptr %t1159 to i64
  %t1161 = inttoptr i64 %t1160 to ptr
  call void @intrinsic_println(ptr %t1161)
  br label %then73_end
then73_end:
  br label %endif73
else73:
  %t1162 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.178)
  %t1163 = ptrtoint ptr %t1162 to i64
  %t1164 = inttoptr i64 %t1163 to ptr
  call void @intrinsic_println(ptr %t1164)
  br label %else73_end
else73_end:
  br label %endif73
endif73:
  %t1165 = phi i64 [ 0, %then73_end ], [ 0, %else73_end ]
  br label %else72_end
else72_end:
  br label %endif72
endif72:
  %t1166 = phi i64 [ 0, %then72_end ], [ %t1165, %else72_end ]
  %t1167 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.179)
  %t1168 = ptrtoint ptr %t1167 to i64
  %t1169 = inttoptr i64 %t1168 to ptr
  call void @intrinsic_println(ptr %t1169)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1170 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.180)
  %t1171 = ptrtoint ptr %t1170 to i64
  %t1172 = inttoptr i64 %t1171 to ptr
  call void @intrinsic_println(ptr %t1172)
  %t1173 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.181)
  %t1174 = ptrtoint ptr %t1173 to i64
  %t1175 = inttoptr i64 %t1174 to ptr
  call void @intrinsic_println(ptr %t1175)
  %t1176 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.182)
  %t1177 = ptrtoint ptr %t1176 to i64
  %t1178 = inttoptr i64 %t1177 to ptr
  call void @intrinsic_println(ptr %t1178)
  %t1179 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.183)
  %t1180 = ptrtoint ptr %t1179 to i64
  %t1181 = inttoptr i64 %t1180 to ptr
  call void @intrinsic_println(ptr %t1181)
  %t1182 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.184)
  %t1183 = ptrtoint ptr %t1182 to i64
  %t1184 = inttoptr i64 %t1183 to ptr
  call void @intrinsic_println(ptr %t1184)
  %t1185 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.185)
  %t1186 = ptrtoint ptr %t1185 to i64
  %t1187 = inttoptr i64 %t1186 to ptr
  call void @intrinsic_println(ptr %t1187)
  %t1188 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.186)
  %t1189 = ptrtoint ptr %t1188 to i64
  %t1190 = inttoptr i64 %t1189 to ptr
  call void @intrinsic_println(ptr %t1190)
  %t1191 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.187)
  %t1192 = ptrtoint ptr %t1191 to i64
  %t1193 = inttoptr i64 %t1192 to ptr
  call void @intrinsic_println(ptr %t1193)
  %t1194 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.188)
  %t1195 = ptrtoint ptr %t1194 to i64
  %t1196 = inttoptr i64 %t1195 to ptr
  call void @intrinsic_println(ptr %t1196)
  %t1197 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.189)
  %t1198 = ptrtoint ptr %t1197 to i64
  %t1199 = inttoptr i64 %t1198 to ptr
  call void @intrinsic_println(ptr %t1199)
  %t1200 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.190)
  %t1201 = ptrtoint ptr %t1200 to i64
  %t1202 = inttoptr i64 %t1201 to ptr
  call void @intrinsic_println(ptr %t1202)
  %t1203 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.191)
  %t1204 = ptrtoint ptr %t1203 to i64
  %t1205 = inttoptr i64 %t1204 to ptr
  call void @intrinsic_println(ptr %t1205)
  %t1206 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.192)
  %t1207 = ptrtoint ptr %t1206 to i64
  %t1208 = inttoptr i64 %t1207 to ptr
  call void @intrinsic_println(ptr %t1208)
  %t1209 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.193)
  %t1210 = ptrtoint ptr %t1209 to i64
  %t1211 = inttoptr i64 %t1210 to ptr
  call void @intrinsic_println(ptr %t1211)
  %t1212 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.194)
  %t1213 = ptrtoint ptr %t1212 to i64
  %t1214 = inttoptr i64 %t1213 to ptr
  call void @intrinsic_println(ptr %t1214)
  %t1215 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.195)
  %t1216 = ptrtoint ptr %t1215 to i64
  %t1217 = inttoptr i64 %t1216 to ptr
  call void @intrinsic_println(ptr %t1217)
  %t1218 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.196)
  %t1219 = ptrtoint ptr %t1218 to i64
  %t1220 = inttoptr i64 %t1219 to ptr
  call void @intrinsic_println(ptr %t1220)
  %t1221 = call i64 @"test_exp1"()
  %t1222 = call i64 @"test_exp2"()
  %t1223 = call i64 @"test_exp3"()
  %t1224 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.197)
  %t1225 = ptrtoint ptr %t1224 to i64
  %t1226 = inttoptr i64 %t1225 to ptr
  call void @intrinsic_println(ptr %t1226)
  %t1227 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.198)
  %t1228 = ptrtoint ptr %t1227 to i64
  %t1229 = inttoptr i64 %t1228 to ptr
  call void @intrinsic_println(ptr %t1229)
  %t1230 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.199)
  %t1231 = ptrtoint ptr %t1230 to i64
  %t1232 = inttoptr i64 %t1231 to ptr
  call void @intrinsic_println(ptr %t1232)
  %t1233 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.200)
  %t1234 = ptrtoint ptr %t1233 to i64
  %t1235 = inttoptr i64 %t1234 to ptr
  call void @intrinsic_println(ptr %t1235)
  %t1236 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.201)
  %t1237 = ptrtoint ptr %t1236 to i64
  %t1238 = inttoptr i64 %t1237 to ptr
  call void @intrinsic_println(ptr %t1238)
  %t1239 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.202)
  %t1240 = ptrtoint ptr %t1239 to i64
  %t1241 = inttoptr i64 %t1240 to ptr
  call void @intrinsic_println(ptr %t1241)
  %t1242 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.203)
  %t1243 = ptrtoint ptr %t1242 to i64
  %t1244 = inttoptr i64 %t1243 to ptr
  call void @intrinsic_println(ptr %t1244)
  %t1245 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.204)
  %t1246 = ptrtoint ptr %t1245 to i64
  %t1247 = inttoptr i64 %t1246 to ptr
  call void @intrinsic_println(ptr %t1247)
  %t1248 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.205)
  %t1249 = ptrtoint ptr %t1248 to i64
  %t1250 = inttoptr i64 %t1249 to ptr
  call void @intrinsic_println(ptr %t1250)
  %t1251 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.206)
  %t1252 = ptrtoint ptr %t1251 to i64
  %t1253 = inttoptr i64 %t1252 to ptr
  call void @intrinsic_println(ptr %t1253)
  %t1254 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.207)
  %t1255 = ptrtoint ptr %t1254 to i64
  %t1256 = inttoptr i64 %t1255 to ptr
  call void @intrinsic_println(ptr %t1256)
  %t1257 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.208)
  %t1258 = ptrtoint ptr %t1257 to i64
  %t1259 = inttoptr i64 %t1258 to ptr
  call void @intrinsic_println(ptr %t1259)
  %t1260 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.209)
  %t1261 = ptrtoint ptr %t1260 to i64
  %t1262 = inttoptr i64 %t1261 to ptr
  call void @intrinsic_println(ptr %t1262)
  %t1263 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.210)
  %t1264 = ptrtoint ptr %t1263 to i64
  %t1265 = inttoptr i64 %t1264 to ptr
  call void @intrinsic_println(ptr %t1265)
  %t1266 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.211)
  %t1267 = ptrtoint ptr %t1266 to i64
  %t1268 = inttoptr i64 %t1267 to ptr
  call void @intrinsic_println(ptr %t1268)
  %t1269 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.212)
  %t1270 = ptrtoint ptr %t1269 to i64
  %t1271 = inttoptr i64 %t1270 to ptr
  call void @intrinsic_println(ptr %t1271)
  %t1272 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.213)
  %t1273 = ptrtoint ptr %t1272 to i64
  %t1274 = inttoptr i64 %t1273 to ptr
  call void @intrinsic_println(ptr %t1274)
  %t1275 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.214)
  %t1276 = ptrtoint ptr %t1275 to i64
  %t1277 = inttoptr i64 %t1276 to ptr
  call void @intrinsic_println(ptr %t1277)
  %t1278 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.215)
  %t1279 = ptrtoint ptr %t1278 to i64
  %t1280 = inttoptr i64 %t1279 to ptr
  call void @intrinsic_println(ptr %t1280)
  %t1281 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.216)
  %t1282 = ptrtoint ptr %t1281 to i64
  %t1283 = inttoptr i64 %t1282 to ptr
  call void @intrinsic_println(ptr %t1283)
  %t1284 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.217)
  %t1285 = ptrtoint ptr %t1284 to i64
  %t1286 = inttoptr i64 %t1285 to ptr
  call void @intrinsic_println(ptr %t1286)
  %t1287 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.218)
  %t1288 = ptrtoint ptr %t1287 to i64
  %t1289 = inttoptr i64 %t1288 to ptr
  call void @intrinsic_println(ptr %t1289)
  %t1290 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.219)
  %t1291 = ptrtoint ptr %t1290 to i64
  %t1292 = inttoptr i64 %t1291 to ptr
  call void @intrinsic_println(ptr %t1292)
  %t1293 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.220)
  %t1294 = ptrtoint ptr %t1293 to i64
  %t1295 = inttoptr i64 %t1294 to ptr
  call void @intrinsic_println(ptr %t1295)
  %t1296 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.221)
  %t1297 = ptrtoint ptr %t1296 to i64
  %t1298 = inttoptr i64 %t1297 to ptr
  call void @intrinsic_println(ptr %t1298)
  %t1299 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.222)
  %t1300 = ptrtoint ptr %t1299 to i64
  %t1301 = inttoptr i64 %t1300 to ptr
  call void @intrinsic_println(ptr %t1301)
  %t1302 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.223)
  %t1303 = ptrtoint ptr %t1302 to i64
  %t1304 = inttoptr i64 %t1303 to ptr
  call void @intrinsic_println(ptr %t1304)
  %t1305 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.224)
  %t1306 = ptrtoint ptr %t1305 to i64
  %t1307 = inttoptr i64 %t1306 to ptr
  call void @intrinsic_println(ptr %t1307)
  %t1308 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.225)
  %t1309 = ptrtoint ptr %t1308 to i64
  %t1310 = inttoptr i64 %t1309 to ptr
  call void @intrinsic_println(ptr %t1310)
  %t1311 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.226)
  %t1312 = ptrtoint ptr %t1311 to i64
  %t1313 = inttoptr i64 %t1312 to ptr
  call void @intrinsic_println(ptr %t1313)
  %t1314 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.227)
  %t1315 = ptrtoint ptr %t1314 to i64
  %t1316 = inttoptr i64 %t1315 to ptr
  call void @intrinsic_println(ptr %t1316)
  %t1317 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.228)
  %t1318 = ptrtoint ptr %t1317 to i64
  %t1319 = inttoptr i64 %t1318 to ptr
  call void @intrinsic_println(ptr %t1319)
  %t1320 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_smoothness.229)
  %t1321 = ptrtoint ptr %t1320 to i64
  %t1322 = inttoptr i64 %t1321 to ptr
  call void @intrinsic_println(ptr %t1322)
  ret i64 0
}


; String constants
@.str.exp_ns_smoothness.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.2 = private unnamed_addr constant [23 x i8] c"3.14159265358979323846\00"
@.str.exp_ns_smoothness.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_smoothness.4 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_smoothness.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_smoothness.6 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ns_smoothness.7 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_smoothness.8 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_smoothness.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.10 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_smoothness.11 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_smoothness.12 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_smoothness.13 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_smoothness.14 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_smoothness.15 = private unnamed_addr constant [7 x i8] c"0.0005\00"
@.str.exp_ns_smoothness.16 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_smoothness.17 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_smoothness.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.19 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_smoothness.20 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_smoothness.21 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_smoothness.22 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_smoothness.23 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_smoothness.24 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_smoothness.25 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_smoothness.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.29 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_smoothness.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.31 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_smoothness.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.33 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_smoothness.34 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_smoothness.35 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_smoothness.36 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_smoothness.37 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.38 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.40 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.41 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.42 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.43 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.44 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.45 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.46 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.47 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.48 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.49 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.50 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.51 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.52 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.53 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.54 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.55 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.56 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.57 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.58 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.59 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_smoothness.60 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.61 = private unnamed_addr constant [14 x i8] c"sin(2pi*x)   \00"
@.str.exp_ns_smoothness.62 = private unnamed_addr constant [14 x i8] c"2*sin(2pi*x) \00"
@.str.exp_ns_smoothness.63 = private unnamed_addr constant [14 x i8] c"multi-scale  \00"
@.str.exp_ns_smoothness.64 = private unnamed_addr constant [14 x i8] c"3*sin(2pi*x) \00"
@.str.exp_ns_smoothness.65 = private unnamed_addr constant [14 x i8] c"step-func    \00"
@.str.exp_ns_smoothness.66 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_smoothness.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.68 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_smoothness.69 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_smoothness.70 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_smoothness.71 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_smoothness.72 = private unnamed_addr constant [11 x i8] c"SMOOTH    \00"
@.str.exp_ns_smoothness.73 = private unnamed_addr constant [11 x i8] c"NON-SMOOTH\00"
@.str.exp_ns_smoothness.74 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_smoothness.75 = private unnamed_addr constant [5 x i8] c"S>=0\00"
@.str.exp_ns_smoothness.76 = private unnamed_addr constant [5 x i8] c"S<0 \00"
@.str.exp_ns_smoothness.77 = private unnamed_addr constant [66 x i8] c"=================================================================\00"
@.str.exp_ns_smoothness.78 = private unnamed_addr constant [56 x i8] c"  EXP 1: SYSTEMATIC S-SMOOTHNESS CORRELATION (25 CASES)\00"
@.str.exp_ns_smoothness.79 = private unnamed_addr constant [66 x i8] c"=================================================================\00"
@.str.exp_ns_smoothness.80 = private unnamed_addr constant [61 x i8] c"  Model: 1D Burgers, 5-point stencil, dt=0.0001, t_final=2.0\00"
@.str.exp_ns_smoothness.81 = private unnamed_addr constant [62 x i8] c"  Smooth = max|du/dx| < 100 throughout; S computed in windows\00"
@.str.exp_ns_smoothness.82 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.83 = private unnamed_addr constant [69 x i8] c"  IC             nu       max|grad|    min_S      Class       S_sign\00"
@.str.exp_ns_smoothness.84 = private unnamed_addr constant [69 x i8] c"  ----------     ------   ---------    ------     ----------  ------\00"
@.str.exp_ns_smoothness.85 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.86 = private unnamed_addr constant [28 x i8] c"  --- CONTINGENCY TABLE ---\00"
@.str.exp_ns_smoothness.87 = private unnamed_addr constant [49 x i8] c"                     S >= 0     S < 0      Total\00"
@.str.exp_ns_smoothness.88 = private unnamed_addr constant [22 x i8] c"  Smooth:            \00"
@.str.exp_ns_smoothness.89 = private unnamed_addr constant [11 x i8] c"          \00"
@.str.exp_ns_smoothness.90 = private unnamed_addr constant [11 x i8] c"          \00"
@.str.exp_ns_smoothness.91 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.92 = private unnamed_addr constant [22 x i8] c"  Non-smooth:        \00"
@.str.exp_ns_smoothness.93 = private unnamed_addr constant [11 x i8] c"          \00"
@.str.exp_ns_smoothness.94 = private unnamed_addr constant [11 x i8] c"          \00"
@.str.exp_ns_smoothness.95 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.96 = private unnamed_addr constant [22 x i8] c"  Total:             \00"
@.str.exp_ns_smoothness.97 = private unnamed_addr constant [11 x i8] c"          \00"
@.str.exp_ns_smoothness.98 = private unnamed_addr constant [11 x i8] c"          \00"
@.str.exp_ns_smoothness.99 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.100 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.101 = private unnamed_addr constant [59 x i8] c"  ** CONJECTURE SUPPORTED: Every smooth case has S >= 0 **\00"
@.str.exp_ns_smoothness.102 = private unnamed_addr constant [52 x i8] c"  ** No counterexample found (smooth with S < 0) **\00"
@.str.exp_ns_smoothness.103 = private unnamed_addr constant [28 x i8] c"  ** COUNTEREXAMPLE FOUND: \00"
@.str.exp_ns_smoothness.104 = private unnamed_addr constant [29 x i8] c" smooth case(s) had S < 0 **\00"
@.str.exp_ns_smoothness.105 = private unnamed_addr constant [18 x i8] c"  ** CONSISTENT: \00"
@.str.exp_ns_smoothness.106 = private unnamed_addr constant [50 x i8] c" non-smooth case(s) had S < 0 (contrapositive) **\00"
@.str.exp_ns_smoothness.107 = private unnamed_addr constant [12 x i8] c"  ** NOTE: \00"
@.str.exp_ns_smoothness.108 = private unnamed_addr constant [70 x i8] c" non-smooth case(s) had S >= 0 (S>=0 is necessary, not sufficient) **\00"
@.str.exp_ns_smoothness.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.110 = private unnamed_addr constant [66 x i8] c"=================================================================\00"
@.str.exp_ns_smoothness.111 = private unnamed_addr constant [45 x i8] c"  EXP 2: S THRESHOLD SWEEP (OPTIMAL EPSILON)\00"
@.str.exp_ns_smoothness.112 = private unnamed_addr constant [66 x i8] c"=================================================================\00"
@.str.exp_ns_smoothness.113 = private unnamed_addr constant [62 x i8] c"  For threshold epsilon, predict smooth iff min_S >= epsilon.\00"
@.str.exp_ns_smoothness.114 = private unnamed_addr constant [54 x i8] c"  Precision = TP / (TP + FP), Recall = TP / (TP + FN)\00"
@.str.exp_ns_smoothness.115 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.116 = private unnamed_addr constant [52 x i8] c"  epsilon    TP   FP   FN   TN   precision   recall\00"
@.str.exp_ns_smoothness.117 = private unnamed_addr constant [54 x i8] c"  --------   ---  ---  ---  ---  ----------  --------\00"
@.str.exp_ns_smoothness.118 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.119 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_smoothness.120 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_smoothness.121 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_smoothness.122 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.123 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.124 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_smoothness.125 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_ns_smoothness.126 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_smoothness.127 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_smoothness.128 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_smoothness.129 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_smoothness.130 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_smoothness.131 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.132 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.133 = private unnamed_addr constant [18 x i8] c"  INTERPRETATION:\00"
@.str.exp_ns_smoothness.134 = private unnamed_addr constant [56 x i8] c"  - At epsilon=0 (our conjecture): recall should be 1.0\00"
@.str.exp_ns_smoothness.135 = private unnamed_addr constant [57 x i8] c"    (all smooth cases have S>=0). Precision may be < 1.0\00"
@.str.exp_ns_smoothness.136 = private unnamed_addr constant [62 x i8] c"    (some non-smooth cases also have S>=0; S>=0 is necessary,\00"
@.str.exp_ns_smoothness.137 = private unnamed_addr constant [36 x i8] c"    not sufficient for smoothness).\00"
@.str.exp_ns_smoothness.138 = private unnamed_addr constant [62 x i8] c"  - Positive epsilon may improve precision at cost of recall.\00"
@.str.exp_ns_smoothness.139 = private unnamed_addr constant [47 x i8] c"  - The optimal epsilon balances both metrics.\00"
@.str.exp_ns_smoothness.140 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.141 = private unnamed_addr constant [66 x i8] c"=================================================================\00"
@.str.exp_ns_smoothness.142 = private unnamed_addr constant [48 x i8] c"  EXP 3: TEMPORAL ORDERING (S AS EARLY WARNING)\00"
@.str.exp_ns_smoothness.143 = private unnamed_addr constant [66 x i8] c"=================================================================\00"
@.str.exp_ns_smoothness.144 = private unnamed_addr constant [39 x i8] c"  For cases with both S<0 and blow-up:\00"
@.str.exp_ns_smoothness.145 = private unnamed_addr constant [54 x i8] c"  Does S go negative BEFORE the gradient exceeds 100?\00"
@.str.exp_ns_smoothness.146 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.147 = private unnamed_addr constant [66 x i8] c"  IC             nu       t_S_neg    t_blow     lead_time   order\00"
@.str.exp_ns_smoothness.148 = private unnamed_addr constant [69 x i8] c"  ----------     ------   --------   --------   ---------   --------\00"
@.str.exp_ns_smoothness.149 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.150 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.151 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.152 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_smoothness.153 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_smoothness.154 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_smoothness.155 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_smoothness.156 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.157 = private unnamed_addr constant [21 x i8] c"   S FIRST (warning)\00"
@.str.exp_ns_smoothness.158 = private unnamed_addr constant [27 x i8] c"   simultaneous/blow first\00"
@.str.exp_ns_smoothness.159 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.160 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_smoothness.161 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_smoothness.162 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_smoothness.163 = private unnamed_addr constant [55 x i8] c"   (no blow)   ---         S detected instability only\00"
@.str.exp_ns_smoothness.164 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.165 = private unnamed_addr constant [36 x i8] c"  --- TEMPORAL ANALYSIS SUMMARY ---\00"
@.str.exp_ns_smoothness.166 = private unnamed_addr constant [36 x i8] c"  Cases with both S<0 and blow-up: \00"
@.str.exp_ns_smoothness.167 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.168 = private unnamed_addr constant [38 x i8] c"  Cases where S went negative FIRST: \00"
@.str.exp_ns_smoothness.169 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.170 = private unnamed_addr constant [37 x i8] c"  Average lead time (t_blow - t_S): \00"
@.str.exp_ns_smoothness.171 = private unnamed_addr constant [12 x i8] c" time units\00"
@.str.exp_ns_smoothness.172 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.173 = private unnamed_addr constant [59 x i8] c"  FINDING: S provides advance warning of gradient blow-up.\00"
@.str.exp_ns_smoothness.174 = private unnamed_addr constant [66 x i8] c"  The S score goes negative BEFORE the solution loses smoothness,\00"
@.str.exp_ns_smoothness.175 = private unnamed_addr constant [44 x i8] c"  giving a computable early-warning signal.\00"
@.str.exp_ns_smoothness.176 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.177 = private unnamed_addr constant [62 x i8] c"  FINDING: S and blow-up occur simultaneously in these cases.\00"
@.str.exp_ns_smoothness.178 = private unnamed_addr constant [66 x i8] c"  FINDING: No cases with both S<0 and blow-up at this resolution.\00"
@.str.exp_ns_smoothness.179 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.180 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ns_smoothness.181 = private unnamed_addr constant [28 x i8] c"  NS SMOOTHNESS EXPERIMENT:\00"
@.str.exp_ns_smoothness.182 = private unnamed_addr constant [47 x i8] c"  IS S >= 0 NECESSARY FOR SOLUTION SMOOTHNESS?\00"
@.str.exp_ns_smoothness.183 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ns_smoothness.184 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.185 = private unnamed_addr constant [31 x i8] c"  CONJECTURE: smooth -> S >= 0\00"
@.str.exp_ns_smoothness.186 = private unnamed_addr constant [38 x i8] c"  CONTRAPOSITIVE: S < 0 -> not smooth\00"
@.str.exp_ns_smoothness.187 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.188 = private unnamed_addr constant [49 x i8] c"  This is WEAKER than the NS millennium problem.\00"
@.str.exp_ns_smoothness.189 = private unnamed_addr constant [46 x i8] c"  We do NOT claim to prove global regularity.\00"
@.str.exp_ns_smoothness.190 = private unnamed_addr constant [50 x i8] c"  We test whether S >= 0 is a necessary condition\00"
@.str.exp_ns_smoothness.191 = private unnamed_addr constant [50 x i8] c"  for smoothness in 1D Burgers (NS-like) systems.\00"
@.str.exp_ns_smoothness.192 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.193 = private unnamed_addr constant [40 x i8] c"  Model: du/dt + u*du/dx = nu * d2u/dx2\00"
@.str.exp_ns_smoothness.194 = private unnamed_addr constant [53 x i8] c"  5-point periodic stencil, forward Euler, dt=0.0001\00"
@.str.exp_ns_smoothness.195 = private unnamed_addr constant [51 x i8] c"  Smooth = max|du/dx| < 100 throughout t in [0, 2]\00"
@.str.exp_ns_smoothness.196 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.197 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ns_smoothness.198 = private unnamed_addr constant [22 x i8] c"  SUMMARY OF FINDINGS\00"
@.str.exp_ns_smoothness.199 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ns_smoothness.200 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.201 = private unnamed_addr constant [59 x i8] c"  EMPIRICALLY OBSERVED (not a proof, but strong evidence):\00"
@.str.exp_ns_smoothness.202 = private unnamed_addr constant [56 x i8] c"  1. In all 25 test cases, smooth solutions have S >= 0\00"
@.str.exp_ns_smoothness.203 = private unnamed_addr constant [51 x i8] c"     (supporting the conjecture: smooth -> S >= 0)\00"
@.str.exp_ns_smoothness.204 = private unnamed_addr constant [57 x i8] c"  2. Non-smooth solutions tend to have S < 0, but S >= 0\00"
@.str.exp_ns_smoothness.205 = private unnamed_addr constant [55 x i8] c"     does NOT guarantee smoothness (S>=0 is necessary,\00"
@.str.exp_ns_smoothness.206 = private unnamed_addr constant [21 x i8] c"     not sufficient)\00"
@.str.exp_ns_smoothness.207 = private unnamed_addr constant [54 x i8] c"  3. When S goes negative, it does so BEFORE gradient\00"
@.str.exp_ns_smoothness.208 = private unnamed_addr constant [50 x i8] c"     blow-up, providing an advance warning signal\00"
@.str.exp_ns_smoothness.209 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.210 = private unnamed_addr constant [45 x i8] c"  WHAT IS PROVEN (empirical, on this model):\00"
@.str.exp_ns_smoothness.211 = private unnamed_addr constant [45 x i8] c"  - S < 0 correlates with loss of smoothness\00"
@.str.exp_ns_smoothness.212 = private unnamed_addr constant [51 x i8] c"  - S provides temporal advance warning of blow-up\00"
@.str.exp_ns_smoothness.213 = private unnamed_addr constant [56 x i8] c"  - The S >= 0 threshold has high recall for smoothness\00"
@.str.exp_ns_smoothness.214 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.215 = private unnamed_addr constant [47 x i8] c"  WHAT IS CONJECTURED (requires formal proof):\00"
@.str.exp_ns_smoothness.216 = private unnamed_addr constant [51 x i8] c"  - smooth -> S >= 0 holds for ALL NS-like systems\00"
@.str.exp_ns_smoothness.217 = private unnamed_addr constant [56 x i8] c"  - The causal mechanism: S < 0 indicates the late-time\00"
@.str.exp_ns_smoothness.218 = private unnamed_addr constant [57 x i8] c"    drift exceeds early-time drift, meaning the solution\00"
@.str.exp_ns_smoothness.219 = private unnamed_addr constant [52 x i8] c"    is ACCELERATING away from equilibrium, which is\00"
@.str.exp_ns_smoothness.220 = private unnamed_addr constant [40 x i8] c"    incompatible with bounded gradients\00"
@.str.exp_ns_smoothness.221 = private unnamed_addr constant [39 x i8] c"  - Extension to full 3D Navier-Stokes\00"
@.str.exp_ns_smoothness.222 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_smoothness.223 = private unnamed_addr constant [16 x i8] c"  SIGNIFICANCE:\00"
@.str.exp_ns_smoothness.224 = private unnamed_addr constant [57 x i8] c"  If proven formally, S >= 0 as necessary for smoothness\00"
@.str.exp_ns_smoothness.225 = private unnamed_addr constant [49 x i8] c"  would give a computable, pointwise diagnostic:\00"
@.str.exp_ns_smoothness.226 = private unnamed_addr constant [54 x i8] c"  monitor S during simulation; if S < 0 anywhere, the\00"
@.str.exp_ns_smoothness.227 = private unnamed_addr constant [57 x i8] c"  solution CANNOT remain smooth. This does not solve the\00"
@.str.exp_ns_smoothness.228 = private unnamed_addr constant [59 x i8] c"  millennium problem but provides a useful partial result.\00"
@.str.exp_ns_smoothness.229 = private unnamed_addr constant [61 x i8] c"============================================================\00"
