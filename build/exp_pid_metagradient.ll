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
  %t1 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t9 = load i64, ptr %local.x
  %t10 = load i64, ptr %local.lo
  %t11 = call i64 @"sx_f64_lt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.lo
  ret i64 %t13
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.x
  %t16 = load i64, ptr %local.hi
  %t17 = call i64 @"sx_f64_gt"(i64 %t15, i64 %t16)
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  %t19 = load i64, ptr %local.hi
  ret i64 %t19
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t20 = phi i64 [ 0, %else2_end ]
  %t21 = load i64, ptr %local.x
  ret i64 %t21
}

define i64 @"train_pid"(i64 %w1, i64 %w2, i64 %w3, i64 %base_lr, i64 %steps, i64 %mode) nounwind {
entry:
  %local.x0.22 = alloca i64
  %local.x1.23 = alloca i64
  %local.x2.24 = alloca i64
  %local.x3.25 = alloca i64
  %local.step.26 = alloca i64
  %local.lr.27 = alloca i64
  %local.prev_loss.28 = alloca i64
  %local.prev_drift.29 = alloca i64
  %local.prev_s.30 = alloca i64
  %local.prev_s_prime.31 = alloca i64
  %local.drift.32 = alloca i64
  %local.s_val.33 = alloca i64
  %local.s_prime.34 = alloca i64
  %local.s_double.35 = alloca i64
  %local.loss.36 = alloca i64
  %local.g0.37 = alloca i64
  %local.g1.38 = alloca i64
  %local.g2.39 = alloca i64
  %local.g3.40 = alloca i64
  %local.pi.41 = alloca i64
  %local.l1.42 = alloca i64
  %local.l2.43 = alloca i64
  %local.l3.44 = alloca i64
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.base_lr = alloca i64
  store i64 %base_lr, ptr %local.base_lr
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.mode = alloca i64
  store i64 %mode, ptr %local.mode
  %t45 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.2)
  store i64 %t45, ptr %local.x0.22
  %t46 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.3)
  store i64 %t46, ptr %local.x1.23
  %t47 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.4)
  store i64 %t47, ptr %local.x2.24
  %t48 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.5)
  store i64 %t48, ptr %local.x3.25
  store i64 0, ptr %local.step.26
  %t49 = load i64, ptr %local.base_lr
  store i64 %t49, ptr %local.lr.27
  %t50 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.6)
  store i64 %t50, ptr %local.prev_loss.28
  %t51 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.7)
  store i64 %t51, ptr %local.prev_drift.29
  %t52 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.8)
  store i64 %t52, ptr %local.prev_s.30
  %t53 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.9)
  store i64 %t53, ptr %local.prev_s_prime.31
  %t54 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.10)
  store i64 %t54, ptr %local.drift.32
  %t55 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.11)
  store i64 %t55, ptr %local.s_val.33
  %t56 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.12)
  store i64 %t56, ptr %local.s_prime.34
  %t57 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.13)
  store i64 %t57, ptr %local.s_double.35
  %t58 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.14)
  store i64 %t58, ptr %local.loss.36
  %t59 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.15)
  store i64 %t59, ptr %local.g0.37
  %t60 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.16)
  store i64 %t60, ptr %local.g1.38
  %t61 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.17)
  store i64 %t61, ptr %local.g2.39
  %t62 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.18)
  store i64 %t62, ptr %local.g3.40
  %t63 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.19)
  store i64 %t63, ptr %local.pi.41
  br label %loop3
loop3:
  %t64 = load i64, ptr %local.step.26
  %t65 = load i64, ptr %local.steps
  %t66 = icmp slt i64 %t64, %t65
  %t67 = zext i1 %t66 to i64
  %t68 = icmp ne i64 %t67, 0
  br i1 %t68, label %body3, label %endloop3
body3:
  %t69 = load i64, ptr %local.mode
  %t70 = icmp eq i64 %t69, 0
  %t71 = zext i1 %t70 to i64
  %t72 = icmp ne i64 %t71, 0
  br i1 %t72, label %then4, label %else4
then4:
  %t73 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.20)
  %t74 = load i64, ptr %local.x0.22
  %t75 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.21)
  %t76 = call i64 @"sx_f64_sub"(i64 %t74, i64 %t75)
  %t77 = call i64 @"sx_f64_mul"(i64 %t73, i64 %t76)
  %t78 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.22)
  %t79 = load i64, ptr %local.x0.22
  %t80 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.23)
  %t81 = call i64 @"sx_f64_add"(i64 %t79, i64 %t80)
  %t82 = call i64 @"sx_f64_mul"(i64 %t78, i64 %t81)
  %t83 = call i64 @"sx_f64_add"(i64 %t77, i64 %t82)
  %t84 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.24)
  %t85 = load i64, ptr %local.x0.22
  %t86 = call i64 @"sx_f64_mul"(i64 %t84, i64 %t85)
  %t87 = call i64 @"sx_f64_add"(i64 %t83, i64 %t86)
  store i64 %t87, ptr %local.g0.37
  %t88 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.25)
  %t89 = load i64, ptr %local.x1.23
  %t90 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.26)
  %t91 = call i64 @"sx_f64_sub"(i64 %t89, i64 %t90)
  %t92 = call i64 @"sx_f64_mul"(i64 %t88, i64 %t91)
  %t93 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.27)
  %t94 = load i64, ptr %local.x1.23
  %t95 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.28)
  %t96 = call i64 @"sx_f64_sub"(i64 %t94, i64 %t95)
  %t97 = call i64 @"sx_f64_mul"(i64 %t93, i64 %t96)
  %t98 = call i64 @"sx_f64_add"(i64 %t92, i64 %t97)
  %t99 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.29)
  %t100 = load i64, ptr %local.x1.23
  %t101 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.30)
  %t102 = call i64 @"sx_f64_add"(i64 %t100, i64 %t101)
  %t103 = call i64 @"sx_f64_mul"(i64 %t99, i64 %t102)
  %t104 = call i64 @"sx_f64_add"(i64 %t98, i64 %t103)
  store i64 %t104, ptr %local.g1.38
  %t105 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.31)
  %t106 = load i64, ptr %local.x2.24
  %t107 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.32)
  %t108 = call i64 @"sx_f64_add"(i64 %t106, i64 %t107)
  %t109 = call i64 @"sx_f64_mul"(i64 %t105, i64 %t108)
  %t110 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.33)
  %t111 = load i64, ptr %local.x2.24
  %t112 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.34)
  %t113 = call i64 @"sx_f64_sub"(i64 %t111, i64 %t112)
  %t114 = call i64 @"sx_f64_mul"(i64 %t110, i64 %t113)
  %t115 = call i64 @"sx_f64_add"(i64 %t109, i64 %t114)
  %t116 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.35)
  %t117 = load i64, ptr %local.x2.24
  %t118 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.36)
  %t119 = call i64 @"sx_f64_sub"(i64 %t117, i64 %t118)
  %t120 = call i64 @"sx_f64_mul"(i64 %t116, i64 %t119)
  %t121 = call i64 @"sx_f64_add"(i64 %t115, i64 %t120)
  store i64 %t121, ptr %local.g2.39
  %t122 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.37)
  %t123 = load i64, ptr %local.x3.25
  %t124 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.38)
  %t125 = call i64 @"sx_f64_sub"(i64 %t123, i64 %t124)
  %t126 = call i64 @"sx_f64_mul"(i64 %t122, i64 %t125)
  %t127 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.39)
  %t128 = load i64, ptr %local.x3.25
  %t129 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.40)
  %t130 = call i64 @"sx_f64_add"(i64 %t128, i64 %t129)
  %t131 = call i64 @"sx_f64_mul"(i64 %t127, i64 %t130)
  %t132 = call i64 @"sx_f64_add"(i64 %t126, i64 %t131)
  %t133 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.41)
  %t134 = load i64, ptr %local.x3.25
  %t135 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.42)
  %t136 = call i64 @"sx_f64_sub"(i64 %t134, i64 %t135)
  %t137 = call i64 @"sx_f64_mul"(i64 %t133, i64 %t136)
  %t138 = call i64 @"sx_f64_add"(i64 %t132, i64 %t137)
  store i64 %t138, ptr %local.g3.40
  br label %then4_end
then4_end:
  br label %endif4
else4:
  %t139 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.43)
  %t140 = load i64, ptr %local.x0.22
  %t141 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.44)
  %t142 = call i64 @"sx_f64_sub"(i64 %t140, i64 %t141)
  %t143 = call i64 @"sx_f64_mul"(i64 %t139, i64 %t142)
  %t144 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.45)
  %t145 = load i64, ptr %local.pi.41
  %t146 = call i64 @"sx_f64_mul"(i64 %t144, i64 %t145)
  %t147 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.46)
  %t148 = load i64, ptr %local.pi.41
  %t149 = call i64 @"sx_f64_mul"(i64 %t147, i64 %t148)
  %t150 = load i64, ptr %local.x0.22
  %t151 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.47)
  %t152 = call i64 @"sx_f64_sub"(i64 %t150, i64 %t151)
  %t153 = call i64 @"sx_f64_mul"(i64 %t149, i64 %t152)
  %t154 = call i64 @"sin_f64"(i64 %t153)
  %t155 = call i64 @"sx_f64_mul"(i64 %t146, i64 %t154)
  %t156 = call i64 @"sx_f64_add"(i64 %t143, i64 %t155)
  %t157 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.48)
  %t158 = load i64, ptr %local.x0.22
  %t159 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.49)
  %t160 = call i64 @"sx_f64_add"(i64 %t158, i64 %t159)
  %t161 = call i64 @"sx_f64_mul"(i64 %t157, i64 %t160)
  %t162 = call i64 @"sx_f64_add"(i64 %t156, i64 %t161)
  %t163 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.50)
  %t164 = load i64, ptr %local.pi.41
  %t165 = call i64 @"sx_f64_mul"(i64 %t163, i64 %t164)
  %t166 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.51)
  %t167 = load i64, ptr %local.pi.41
  %t168 = call i64 @"sx_f64_mul"(i64 %t166, i64 %t167)
  %t169 = load i64, ptr %local.x0.22
  %t170 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.52)
  %t171 = call i64 @"sx_f64_add"(i64 %t169, i64 %t170)
  %t172 = call i64 @"sx_f64_mul"(i64 %t168, i64 %t171)
  %t173 = call i64 @"sin_f64"(i64 %t172)
  %t174 = call i64 @"sx_f64_mul"(i64 %t165, i64 %t173)
  %t175 = call i64 @"sx_f64_add"(i64 %t162, i64 %t174)
  store i64 %t175, ptr %local.g0.37
  %t176 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.53)
  %t177 = load i64, ptr %local.x1.23
  %t178 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.54)
  %t179 = call i64 @"sx_f64_sub"(i64 %t177, i64 %t178)
  %t180 = call i64 @"sx_f64_mul"(i64 %t176, i64 %t179)
  %t181 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.55)
  %t182 = load i64, ptr %local.pi.41
  %t183 = call i64 @"sx_f64_mul"(i64 %t181, i64 %t182)
  %t184 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.56)
  %t185 = load i64, ptr %local.pi.41
  %t186 = call i64 @"sx_f64_mul"(i64 %t184, i64 %t185)
  %t187 = load i64, ptr %local.x1.23
  %t188 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.57)
  %t189 = call i64 @"sx_f64_sub"(i64 %t187, i64 %t188)
  %t190 = call i64 @"sx_f64_mul"(i64 %t186, i64 %t189)
  %t191 = call i64 @"sin_f64"(i64 %t190)
  %t192 = call i64 @"sx_f64_mul"(i64 %t183, i64 %t191)
  %t193 = call i64 @"sx_f64_add"(i64 %t180, i64 %t192)
  %t194 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.58)
  %t195 = load i64, ptr %local.x1.23
  %t196 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.59)
  %t197 = call i64 @"sx_f64_sub"(i64 %t195, i64 %t196)
  %t198 = call i64 @"sx_f64_mul"(i64 %t194, i64 %t197)
  %t199 = call i64 @"sx_f64_add"(i64 %t193, i64 %t198)
  %t200 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.60)
  %t201 = load i64, ptr %local.pi.41
  %t202 = call i64 @"sx_f64_mul"(i64 %t200, i64 %t201)
  %t203 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.61)
  %t204 = load i64, ptr %local.pi.41
  %t205 = call i64 @"sx_f64_mul"(i64 %t203, i64 %t204)
  %t206 = load i64, ptr %local.x1.23
  %t207 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.62)
  %t208 = call i64 @"sx_f64_sub"(i64 %t206, i64 %t207)
  %t209 = call i64 @"sx_f64_mul"(i64 %t205, i64 %t208)
  %t210 = call i64 @"sin_f64"(i64 %t209)
  %t211 = call i64 @"sx_f64_mul"(i64 %t202, i64 %t210)
  %t212 = call i64 @"sx_f64_add"(i64 %t199, i64 %t211)
  store i64 %t212, ptr %local.g1.38
  %t213 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.63)
  %t214 = load i64, ptr %local.x2.24
  %t215 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.64)
  %t216 = call i64 @"sx_f64_add"(i64 %t214, i64 %t215)
  %t217 = call i64 @"sx_f64_mul"(i64 %t213, i64 %t216)
  %t218 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.65)
  %t219 = load i64, ptr %local.pi.41
  %t220 = call i64 @"sx_f64_mul"(i64 %t218, i64 %t219)
  %t221 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.66)
  %t222 = load i64, ptr %local.pi.41
  %t223 = call i64 @"sx_f64_mul"(i64 %t221, i64 %t222)
  %t224 = load i64, ptr %local.x2.24
  %t225 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.67)
  %t226 = call i64 @"sx_f64_add"(i64 %t224, i64 %t225)
  %t227 = call i64 @"sx_f64_mul"(i64 %t223, i64 %t226)
  %t228 = call i64 @"sin_f64"(i64 %t227)
  %t229 = call i64 @"sx_f64_mul"(i64 %t220, i64 %t228)
  %t230 = call i64 @"sx_f64_add"(i64 %t217, i64 %t229)
  %t231 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.68)
  %t232 = load i64, ptr %local.x2.24
  %t233 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.69)
  %t234 = call i64 @"sx_f64_sub"(i64 %t232, i64 %t233)
  %t235 = call i64 @"sx_f64_mul"(i64 %t231, i64 %t234)
  %t236 = call i64 @"sx_f64_add"(i64 %t230, i64 %t235)
  %t237 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.70)
  %t238 = load i64, ptr %local.pi.41
  %t239 = call i64 @"sx_f64_mul"(i64 %t237, i64 %t238)
  %t240 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.71)
  %t241 = load i64, ptr %local.pi.41
  %t242 = call i64 @"sx_f64_mul"(i64 %t240, i64 %t241)
  %t243 = load i64, ptr %local.x2.24
  %t244 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.72)
  %t245 = call i64 @"sx_f64_sub"(i64 %t243, i64 %t244)
  %t246 = call i64 @"sx_f64_mul"(i64 %t242, i64 %t245)
  %t247 = call i64 @"sin_f64"(i64 %t246)
  %t248 = call i64 @"sx_f64_mul"(i64 %t239, i64 %t247)
  %t249 = call i64 @"sx_f64_add"(i64 %t236, i64 %t248)
  store i64 %t249, ptr %local.g2.39
  %t250 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.73)
  %t251 = load i64, ptr %local.x3.25
  %t252 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.74)
  %t253 = call i64 @"sx_f64_sub"(i64 %t251, i64 %t252)
  %t254 = call i64 @"sx_f64_mul"(i64 %t250, i64 %t253)
  %t255 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.75)
  %t256 = load i64, ptr %local.pi.41
  %t257 = call i64 @"sx_f64_mul"(i64 %t255, i64 %t256)
  %t258 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.76)
  %t259 = load i64, ptr %local.pi.41
  %t260 = call i64 @"sx_f64_mul"(i64 %t258, i64 %t259)
  %t261 = load i64, ptr %local.x3.25
  %t262 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.77)
  %t263 = call i64 @"sx_f64_sub"(i64 %t261, i64 %t262)
  %t264 = call i64 @"sx_f64_mul"(i64 %t260, i64 %t263)
  %t265 = call i64 @"sin_f64"(i64 %t264)
  %t266 = call i64 @"sx_f64_mul"(i64 %t257, i64 %t265)
  %t267 = call i64 @"sx_f64_add"(i64 %t254, i64 %t266)
  %t268 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.78)
  %t269 = load i64, ptr %local.x3.25
  %t270 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.79)
  %t271 = call i64 @"sx_f64_add"(i64 %t269, i64 %t270)
  %t272 = call i64 @"sx_f64_mul"(i64 %t268, i64 %t271)
  %t273 = call i64 @"sx_f64_add"(i64 %t267, i64 %t272)
  %t274 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.80)
  %t275 = load i64, ptr %local.pi.41
  %t276 = call i64 @"sx_f64_mul"(i64 %t274, i64 %t275)
  %t277 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.81)
  %t278 = load i64, ptr %local.pi.41
  %t279 = call i64 @"sx_f64_mul"(i64 %t277, i64 %t278)
  %t280 = load i64, ptr %local.x3.25
  %t281 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.82)
  %t282 = call i64 @"sx_f64_add"(i64 %t280, i64 %t281)
  %t283 = call i64 @"sx_f64_mul"(i64 %t279, i64 %t282)
  %t284 = call i64 @"sin_f64"(i64 %t283)
  %t285 = call i64 @"sx_f64_mul"(i64 %t276, i64 %t284)
  %t286 = call i64 @"sx_f64_add"(i64 %t273, i64 %t285)
  store i64 %t286, ptr %local.g3.40
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t287 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t288 = load i64, ptr %local.x0.22
  %t289 = load i64, ptr %local.lr.27
  %t290 = load i64, ptr %local.g0.37
  %t291 = call i64 @"sx_f64_mul"(i64 %t289, i64 %t290)
  %t292 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.83)
  %t293 = call i64 @"sx_f64_div"(i64 %t291, i64 %t292)
  %t294 = call i64 @"sx_f64_sub"(i64 %t288, i64 %t293)
  store i64 %t294, ptr %local.x0.22
  %t295 = load i64, ptr %local.x1.23
  %t296 = load i64, ptr %local.lr.27
  %t297 = load i64, ptr %local.g1.38
  %t298 = call i64 @"sx_f64_mul"(i64 %t296, i64 %t297)
  %t299 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.84)
  %t300 = call i64 @"sx_f64_div"(i64 %t298, i64 %t299)
  %t301 = call i64 @"sx_f64_sub"(i64 %t295, i64 %t300)
  store i64 %t301, ptr %local.x1.23
  %t302 = load i64, ptr %local.x2.24
  %t303 = load i64, ptr %local.lr.27
  %t304 = load i64, ptr %local.g2.39
  %t305 = call i64 @"sx_f64_mul"(i64 %t303, i64 %t304)
  %t306 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.85)
  %t307 = call i64 @"sx_f64_div"(i64 %t305, i64 %t306)
  %t308 = call i64 @"sx_f64_sub"(i64 %t302, i64 %t307)
  store i64 %t308, ptr %local.x2.24
  %t309 = load i64, ptr %local.x3.25
  %t310 = load i64, ptr %local.lr.27
  %t311 = load i64, ptr %local.g3.40
  %t312 = call i64 @"sx_f64_mul"(i64 %t310, i64 %t311)
  %t313 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.86)
  %t314 = call i64 @"sx_f64_div"(i64 %t312, i64 %t313)
  %t315 = call i64 @"sx_f64_sub"(i64 %t309, i64 %t314)
  store i64 %t315, ptr %local.x3.25
  %t316 = load i64, ptr %local.mode
  %t317 = icmp eq i64 %t316, 0
  %t318 = zext i1 %t317 to i64
  %t319 = icmp ne i64 %t318, 0
  br i1 %t319, label %then5, label %else5
then5:
  %t320 = load i64, ptr %local.x0.22
  %t321 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.87)
  %t322 = call i64 @"sx_f64_sub"(i64 %t320, i64 %t321)
  %t323 = load i64, ptr %local.x0.22
  %t324 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.88)
  %t325 = call i64 @"sx_f64_sub"(i64 %t323, i64 %t324)
  %t326 = call i64 @"sx_f64_mul"(i64 %t322, i64 %t325)
  %t327 = load i64, ptr %local.x1.23
  %t328 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.89)
  %t329 = call i64 @"sx_f64_sub"(i64 %t327, i64 %t328)
  %t330 = load i64, ptr %local.x1.23
  %t331 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.90)
  %t332 = call i64 @"sx_f64_sub"(i64 %t330, i64 %t331)
  %t333 = call i64 @"sx_f64_mul"(i64 %t329, i64 %t332)
  %t334 = call i64 @"sx_f64_add"(i64 %t326, i64 %t333)
  %t335 = load i64, ptr %local.x2.24
  %t336 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.91)
  %t337 = call i64 @"sx_f64_add"(i64 %t335, i64 %t336)
  %t338 = load i64, ptr %local.x2.24
  %t339 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.92)
  %t340 = call i64 @"sx_f64_add"(i64 %t338, i64 %t339)
  %t341 = call i64 @"sx_f64_mul"(i64 %t337, i64 %t340)
  %t342 = call i64 @"sx_f64_add"(i64 %t334, i64 %t341)
  %t343 = load i64, ptr %local.x3.25
  %t344 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.93)
  %t345 = call i64 @"sx_f64_sub"(i64 %t343, i64 %t344)
  %t346 = load i64, ptr %local.x3.25
  %t347 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.94)
  %t348 = call i64 @"sx_f64_sub"(i64 %t346, i64 %t347)
  %t349 = call i64 @"sx_f64_mul"(i64 %t345, i64 %t348)
  %t350 = call i64 @"sx_f64_add"(i64 %t342, i64 %t349)
  store i64 %t350, ptr %local.l1.42
  %t351 = load i64, ptr %local.x0.22
  %t352 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.95)
  %t353 = call i64 @"sx_f64_add"(i64 %t351, i64 %t352)
  %t354 = load i64, ptr %local.x0.22
  %t355 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.96)
  %t356 = call i64 @"sx_f64_add"(i64 %t354, i64 %t355)
  %t357 = call i64 @"sx_f64_mul"(i64 %t353, i64 %t356)
  %t358 = load i64, ptr %local.x1.23
  %t359 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.97)
  %t360 = call i64 @"sx_f64_sub"(i64 %t358, i64 %t359)
  %t361 = load i64, ptr %local.x1.23
  %t362 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.98)
  %t363 = call i64 @"sx_f64_sub"(i64 %t361, i64 %t362)
  %t364 = call i64 @"sx_f64_mul"(i64 %t360, i64 %t363)
  %t365 = call i64 @"sx_f64_add"(i64 %t357, i64 %t364)
  %t366 = load i64, ptr %local.x2.24
  %t367 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.99)
  %t368 = call i64 @"sx_f64_sub"(i64 %t366, i64 %t367)
  %t369 = load i64, ptr %local.x2.24
  %t370 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.100)
  %t371 = call i64 @"sx_f64_sub"(i64 %t369, i64 %t370)
  %t372 = call i64 @"sx_f64_mul"(i64 %t368, i64 %t371)
  %t373 = call i64 @"sx_f64_add"(i64 %t365, i64 %t372)
  %t374 = load i64, ptr %local.x3.25
  %t375 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.101)
  %t376 = call i64 @"sx_f64_add"(i64 %t374, i64 %t375)
  %t377 = load i64, ptr %local.x3.25
  %t378 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.102)
  %t379 = call i64 @"sx_f64_add"(i64 %t377, i64 %t378)
  %t380 = call i64 @"sx_f64_mul"(i64 %t376, i64 %t379)
  %t381 = call i64 @"sx_f64_add"(i64 %t373, i64 %t380)
  store i64 %t381, ptr %local.l2.43
  %t382 = load i64, ptr %local.x0.22
  %t383 = load i64, ptr %local.x0.22
  %t384 = call i64 @"sx_f64_mul"(i64 %t382, i64 %t383)
  %t385 = load i64, ptr %local.x1.23
  %t386 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.103)
  %t387 = call i64 @"sx_f64_add"(i64 %t385, i64 %t386)
  %t388 = load i64, ptr %local.x1.23
  %t389 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.104)
  %t390 = call i64 @"sx_f64_add"(i64 %t388, i64 %t389)
  %t391 = call i64 @"sx_f64_mul"(i64 %t387, i64 %t390)
  %t392 = call i64 @"sx_f64_add"(i64 %t384, i64 %t391)
  %t393 = load i64, ptr %local.x2.24
  %t394 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.105)
  %t395 = call i64 @"sx_f64_sub"(i64 %t393, i64 %t394)
  %t396 = load i64, ptr %local.x2.24
  %t397 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.106)
  %t398 = call i64 @"sx_f64_sub"(i64 %t396, i64 %t397)
  %t399 = call i64 @"sx_f64_mul"(i64 %t395, i64 %t398)
  %t400 = call i64 @"sx_f64_add"(i64 %t392, i64 %t399)
  %t401 = load i64, ptr %local.x3.25
  %t402 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.107)
  %t403 = call i64 @"sx_f64_sub"(i64 %t401, i64 %t402)
  %t404 = load i64, ptr %local.x3.25
  %t405 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.108)
  %t406 = call i64 @"sx_f64_sub"(i64 %t404, i64 %t405)
  %t407 = call i64 @"sx_f64_mul"(i64 %t403, i64 %t406)
  %t408 = call i64 @"sx_f64_add"(i64 %t400, i64 %t407)
  store i64 %t408, ptr %local.l3.44
  %t409 = load i64, ptr %local.l1.42
  %t410 = load i64, ptr %local.l2.43
  %t411 = call i64 @"sx_f64_add"(i64 %t409, i64 %t410)
  %t412 = load i64, ptr %local.l3.44
  %t413 = call i64 @"sx_f64_add"(i64 %t411, i64 %t412)
  store i64 %t413, ptr %local.loss.36
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t414 = load i64, ptr %local.g0.37
  %t415 = load i64, ptr %local.g0.37
  %t416 = call i64 @"sx_f64_mul"(i64 %t414, i64 %t415)
  %t417 = load i64, ptr %local.g1.38
  %t418 = load i64, ptr %local.g1.38
  %t419 = call i64 @"sx_f64_mul"(i64 %t417, i64 %t418)
  %t420 = call i64 @"sx_f64_add"(i64 %t416, i64 %t419)
  %t421 = load i64, ptr %local.g2.39
  %t422 = load i64, ptr %local.g2.39
  %t423 = call i64 @"sx_f64_mul"(i64 %t421, i64 %t422)
  %t424 = call i64 @"sx_f64_add"(i64 %t420, i64 %t423)
  %t425 = load i64, ptr %local.g3.40
  %t426 = load i64, ptr %local.g3.40
  %t427 = call i64 @"sx_f64_mul"(i64 %t425, i64 %t426)
  %t428 = call i64 @"sx_f64_add"(i64 %t424, i64 %t427)
  store i64 %t428, ptr %local.loss.36
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t429 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t430 = load i64, ptr %local.loss.36
  %t431 = load i64, ptr %local.prev_loss.28
  %t432 = call i64 @"sx_f64_sub"(i64 %t430, i64 %t431)
  %t433 = call i64 @"abs_f64"(i64 %t432)
  store i64 %t433, ptr %local.drift.32
  %t434 = load i64, ptr %local.prev_drift.29
  %t435 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.109)
  %t436 = call i64 @"sx_f64_gt"(i64 %t434, i64 %t435)
  %t437 = icmp ne i64 %t436, 0
  br i1 %t437, label %then6, label %else6
then6:
  %t438 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.110)
  %t439 = load i64, ptr %local.drift.32
  %t440 = load i64, ptr %local.prev_drift.29
  %t441 = call i64 @"sx_f64_div"(i64 %t439, i64 %t440)
  %t442 = call i64 @"sx_f64_sub"(i64 %t438, i64 %t441)
  store i64 %t442, ptr %local.s_val.33
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t443 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.111)
  store i64 %t443, ptr %local.s_val.33
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t444 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t445 = load i64, ptr %local.s_val.33
  %t446 = load i64, ptr %local.prev_s.30
  %t447 = call i64 @"sx_f64_sub"(i64 %t445, i64 %t446)
  store i64 %t447, ptr %local.s_prime.34
  %t448 = load i64, ptr %local.s_prime.34
  %t449 = load i64, ptr %local.prev_s_prime.31
  %t450 = call i64 @"sx_f64_sub"(i64 %t448, i64 %t449)
  store i64 %t450, ptr %local.s_double.35
  %t451 = load i64, ptr %local.base_lr
  %t452 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.112)
  %t453 = load i64, ptr %local.w1
  %t454 = load i64, ptr %local.s_val.33
  %t455 = call i64 @"sx_f64_mul"(i64 %t453, i64 %t454)
  %t456 = call i64 @"sx_f64_add"(i64 %t452, i64 %t455)
  %t457 = load i64, ptr %local.w2
  %t458 = load i64, ptr %local.s_prime.34
  %t459 = call i64 @"sx_f64_mul"(i64 %t457, i64 %t458)
  %t460 = call i64 @"sx_f64_add"(i64 %t456, i64 %t459)
  %t461 = load i64, ptr %local.w3
  %t462 = load i64, ptr %local.s_double.35
  %t463 = call i64 @"sx_f64_mul"(i64 %t461, i64 %t462)
  %t464 = call i64 @"sx_f64_add"(i64 %t460, i64 %t463)
  %t465 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.113)
  %t466 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.114)
  %t467 = call i64 @"clamp"(i64 %t464, i64 %t465, i64 %t466)
  %t468 = call i64 @"sx_f64_mul"(i64 %t451, i64 %t467)
  store i64 %t468, ptr %local.lr.27
  %t469 = load i64, ptr %local.loss.36
  store i64 %t469, ptr %local.prev_loss.28
  %t470 = load i64, ptr %local.drift.32
  store i64 %t470, ptr %local.prev_drift.29
  %t471 = load i64, ptr %local.s_prime.34
  store i64 %t471, ptr %local.prev_s_prime.31
  %t472 = load i64, ptr %local.s_val.33
  store i64 %t472, ptr %local.prev_s.30
  %t473 = load i64, ptr %local.step.26
  %t474 = add i64 %t473, 1
  store i64 %t474, ptr %local.step.26
  br label %loop3
endloop3:
  %t475 = load i64, ptr %local.loss.36
  ret i64 %t475
}

define i64 @"mg_pid"(i64 %w1, i64 %w2, i64 %w3, i64 %which, i64 %base_lr, i64 %steps, i64 %mode) nounwind {
entry:
  %local.h.476 = alloca i64
  %local.w1p.477 = alloca i64
  %local.w2p.478 = alloca i64
  %local.w3p.479 = alloca i64
  %local.w1m.480 = alloca i64
  %local.w2m.481 = alloca i64
  %local.w3m.482 = alloca i64
  %local.lp.483 = alloca i64
  %local.lm.484 = alloca i64
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.base_lr = alloca i64
  store i64 %base_lr, ptr %local.base_lr
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.mode = alloca i64
  store i64 %mode, ptr %local.mode
  %t485 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.115)
  store i64 %t485, ptr %local.h.476
  %t486 = load i64, ptr %local.w1
  store i64 %t486, ptr %local.w1p.477
  %t487 = load i64, ptr %local.w2
  store i64 %t487, ptr %local.w2p.478
  %t488 = load i64, ptr %local.w3
  store i64 %t488, ptr %local.w3p.479
  %t489 = load i64, ptr %local.w1
  store i64 %t489, ptr %local.w1m.480
  %t490 = load i64, ptr %local.w2
  store i64 %t490, ptr %local.w2m.481
  %t491 = load i64, ptr %local.w3
  store i64 %t491, ptr %local.w3m.482
  %t492 = load i64, ptr %local.which
  %t493 = icmp eq i64 %t492, 0
  %t494 = zext i1 %t493 to i64
  %t495 = icmp ne i64 %t494, 0
  br i1 %t495, label %then7, label %else7
then7:
  %t496 = load i64, ptr %local.w1
  %t497 = load i64, ptr %local.h.476
  %t498 = call i64 @"sx_f64_add"(i64 %t496, i64 %t497)
  store i64 %t498, ptr %local.w1p.477
  %t499 = load i64, ptr %local.w1
  %t500 = load i64, ptr %local.h.476
  %t501 = call i64 @"sx_f64_sub"(i64 %t499, i64 %t500)
  store i64 %t501, ptr %local.w1m.480
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t502 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t503 = load i64, ptr %local.which
  %t504 = icmp eq i64 %t503, 1
  %t505 = zext i1 %t504 to i64
  %t506 = icmp ne i64 %t505, 0
  br i1 %t506, label %then8, label %else8
then8:
  %t507 = load i64, ptr %local.w2
  %t508 = load i64, ptr %local.h.476
  %t509 = call i64 @"sx_f64_add"(i64 %t507, i64 %t508)
  store i64 %t509, ptr %local.w2p.478
  %t510 = load i64, ptr %local.w2
  %t511 = load i64, ptr %local.h.476
  %t512 = call i64 @"sx_f64_sub"(i64 %t510, i64 %t511)
  store i64 %t512, ptr %local.w2m.481
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t513 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t514 = load i64, ptr %local.which
  %t515 = icmp eq i64 %t514, 2
  %t516 = zext i1 %t515 to i64
  %t517 = icmp ne i64 %t516, 0
  br i1 %t517, label %then9, label %else9
then9:
  %t518 = load i64, ptr %local.w3
  %t519 = load i64, ptr %local.h.476
  %t520 = call i64 @"sx_f64_add"(i64 %t518, i64 %t519)
  store i64 %t520, ptr %local.w3p.479
  %t521 = load i64, ptr %local.w3
  %t522 = load i64, ptr %local.h.476
  %t523 = call i64 @"sx_f64_sub"(i64 %t521, i64 %t522)
  store i64 %t523, ptr %local.w3m.482
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t524 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t525 = load i64, ptr %local.w1p.477
  %t526 = load i64, ptr %local.w2p.478
  %t527 = load i64, ptr %local.w3p.479
  %t528 = load i64, ptr %local.base_lr
  %t529 = load i64, ptr %local.steps
  %t530 = load i64, ptr %local.mode
  %t531 = call i64 @"train_pid"(i64 %t525, i64 %t526, i64 %t527, i64 %t528, i64 %t529, i64 %t530)
  store i64 %t531, ptr %local.lp.483
  %t532 = load i64, ptr %local.w1m.480
  %t533 = load i64, ptr %local.w2m.481
  %t534 = load i64, ptr %local.w3m.482
  %t535 = load i64, ptr %local.base_lr
  %t536 = load i64, ptr %local.steps
  %t537 = load i64, ptr %local.mode
  %t538 = call i64 @"train_pid"(i64 %t532, i64 %t533, i64 %t534, i64 %t535, i64 %t536, i64 %t537)
  store i64 %t538, ptr %local.lm.484
  %t539 = load i64, ptr %local.lp.483
  %t540 = load i64, ptr %local.lm.484
  %t541 = call i64 @"sx_f64_sub"(i64 %t539, i64 %t540)
  %t542 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.116)
  %t543 = load i64, ptr %local.h.476
  %t544 = call i64 @"sx_f64_mul"(i64 %t542, i64 %t543)
  %t545 = call i64 @"sx_f64_div"(i64 %t541, i64 %t544)
  ret i64 %t545
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.base_lr.546 = alloca i64
  %local.steps.547 = alloca i64
  %local.loss_fixed.548 = alloca i64
  %local.loss_s_only.549 = alloca i64
  %local.loss_s_sp.550 = alloca i64
  %local.w1.551 = alloca i64
  %local.w2.552 = alloca i64
  %local.w3.553 = alloca i64
  %local.mg.554 = alloca i64
  %local.cycle.555 = alloca i64
  %local.mlr.556 = alloca i64
  %local.cl.557 = alloca i64
  %local.cl.558 = alloca i64
  %local.loss_learned_q.559 = alloca i64
  %local.loss_fixed_r.560 = alloca i64
  %local.rw1.561 = alloca i64
  %local.rw2.562 = alloca i64
  %local.rw3.563 = alloca i64
  %local.loss_learned_r.564 = alloca i64
  %local.loss_none.565 = alloca i64
  %local.loss_p.566 = alloca i64
  %local.loss_pd.567 = alloca i64
  %local.loss_pid.568 = alloca i64
  %local.loss_transfer_001.569 = alloca i64
  %local.loss_fixed_001.570 = alloca i64
  %local.loss_transfer_05.571 = alloca i64
  %local.loss_fixed_05.572 = alloca i64
  %local.loss_first_half.573 = alloca i64
  %local.loss_second_half.574 = alloca i64
  %local.loss_full.575 = alloca i64
  %t576 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.117)
  %t577 = ptrtoint ptr %t576 to i64
  %t578 = inttoptr i64 %t577 to ptr
  call void @intrinsic_println(ptr %t578)
  %t579 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.118)
  %t580 = ptrtoint ptr %t579 to i64
  %t581 = inttoptr i64 %t580 to ptr
  call void @intrinsic_println(ptr %t581)
  %t582 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.119)
  %t583 = ptrtoint ptr %t582 to i64
  %t584 = inttoptr i64 %t583 to ptr
  call void @intrinsic_println(ptr %t584)
  %t585 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.120)
  %t586 = ptrtoint ptr %t585 to i64
  %t587 = inttoptr i64 %t586 to ptr
  call void @intrinsic_println(ptr %t587)
  %t588 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.121)
  %t589 = ptrtoint ptr %t588 to i64
  %t590 = inttoptr i64 %t589 to ptr
  call void @intrinsic_println(ptr %t590)
  %t591 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.122)
  store i64 %t591, ptr %local.base_lr.546
  store i64 500, ptr %local.steps.547
  %t592 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.123)
  %t593 = ptrtoint ptr %t592 to i64
  %t594 = inttoptr i64 %t593 to ptr
  call void @intrinsic_println(ptr %t594)
  %t595 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.124)
  %t596 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.125)
  %t597 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.126)
  %t598 = load i64, ptr %local.base_lr.546
  %t599 = load i64, ptr %local.steps.547
  %t600 = call i64 @"train_pid"(i64 %t595, i64 %t596, i64 %t597, i64 %t598, i64 %t599, i64 0)
  store i64 %t600, ptr %local.loss_fixed.548
  %t601 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.127)
  %t602 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.128)
  %t603 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.129)
  %t604 = load i64, ptr %local.base_lr.546
  %t605 = load i64, ptr %local.steps.547
  %t606 = call i64 @"train_pid"(i64 %t601, i64 %t602, i64 %t603, i64 %t604, i64 %t605, i64 0)
  store i64 %t606, ptr %local.loss_s_only.549
  %t607 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.130)
  %t608 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.131)
  %t609 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.132)
  %t610 = load i64, ptr %local.base_lr.546
  %t611 = load i64, ptr %local.steps.547
  %t612 = call i64 @"train_pid"(i64 %t607, i64 %t608, i64 %t609, i64 %t610, i64 %t611, i64 0)
  store i64 %t612, ptr %local.loss_s_sp.550
  %t613 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.133)
  %t614 = ptrtoint ptr %t613 to i64
  %t615 = inttoptr i64 %t614 to ptr
  call void @intrinsic_print(ptr %t615)
  %t616 = load i64, ptr %local.loss_fixed.548
  %t617 = call i64 @"print_f64"(i64 %t616)
  %t618 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.134)
  %t619 = ptrtoint ptr %t618 to i64
  %t620 = inttoptr i64 %t619 to ptr
  call void @intrinsic_println(ptr %t620)
  %t621 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.135)
  %t622 = ptrtoint ptr %t621 to i64
  %t623 = inttoptr i64 %t622 to ptr
  call void @intrinsic_print(ptr %t623)
  %t624 = load i64, ptr %local.loss_s_only.549
  %t625 = call i64 @"print_f64"(i64 %t624)
  %t626 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.136)
  %t627 = ptrtoint ptr %t626 to i64
  %t628 = inttoptr i64 %t627 to ptr
  call void @intrinsic_println(ptr %t628)
  %t629 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.137)
  %t630 = ptrtoint ptr %t629 to i64
  %t631 = inttoptr i64 %t630 to ptr
  call void @intrinsic_print(ptr %t631)
  %t632 = load i64, ptr %local.loss_s_sp.550
  %t633 = call i64 @"print_f64"(i64 %t632)
  %t634 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.138)
  %t635 = ptrtoint ptr %t634 to i64
  %t636 = inttoptr i64 %t635 to ptr
  call void @intrinsic_println(ptr %t636)
  %t637 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.139)
  store i64 %t637, ptr %local.w1.551
  %t638 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.140)
  store i64 %t638, ptr %local.w2.552
  %t639 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.141)
  store i64 %t639, ptr %local.w3.553
  %t640 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.142)
  store i64 %t640, ptr %local.mg.554
  store i64 0, ptr %local.cycle.555
  %t641 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.143)
  store i64 %t641, ptr %local.mlr.556
  br label %loop10
loop10:
  %t642 = load i64, ptr %local.cycle.555
  %t643 = icmp slt i64 %t642, 40
  %t644 = zext i1 %t643 to i64
  %t645 = icmp ne i64 %t644, 0
  br i1 %t645, label %body10, label %endloop10
body10:
  %t646 = load i64, ptr %local.w1.551
  %t647 = load i64, ptr %local.w2.552
  %t648 = load i64, ptr %local.w3.553
  %t649 = load i64, ptr %local.base_lr.546
  %t650 = load i64, ptr %local.steps.547
  %t651 = call i64 @"mg_pid"(i64 %t646, i64 %t647, i64 %t648, i64 0, i64 %t649, i64 %t650, i64 0)
  store i64 %t651, ptr %local.mg.554
  %t652 = load i64, ptr %local.w1.551
  %t653 = load i64, ptr %local.mlr.556
  %t654 = load i64, ptr %local.mg.554
  %t655 = call i64 @"sx_f64_mul"(i64 %t653, i64 %t654)
  %t656 = call i64 @"sx_f64_sub"(i64 %t652, i64 %t655)
  %t657 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.144)
  %t658 = xor i64 %t657, -9223372036854775808
  %t659 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.145)
  %t660 = call i64 @"clamp"(i64 %t656, i64 %t658, i64 %t659)
  store i64 %t660, ptr %local.w1.551
  %t661 = load i64, ptr %local.w1.551
  %t662 = load i64, ptr %local.w2.552
  %t663 = load i64, ptr %local.w3.553
  %t664 = load i64, ptr %local.base_lr.546
  %t665 = load i64, ptr %local.steps.547
  %t666 = call i64 @"mg_pid"(i64 %t661, i64 %t662, i64 %t663, i64 1, i64 %t664, i64 %t665, i64 0)
  store i64 %t666, ptr %local.mg.554
  %t667 = load i64, ptr %local.w2.552
  %t668 = load i64, ptr %local.mlr.556
  %t669 = load i64, ptr %local.mg.554
  %t670 = call i64 @"sx_f64_mul"(i64 %t668, i64 %t669)
  %t671 = call i64 @"sx_f64_sub"(i64 %t667, i64 %t670)
  %t672 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.146)
  %t673 = xor i64 %t672, -9223372036854775808
  %t674 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.147)
  %t675 = call i64 @"clamp"(i64 %t671, i64 %t673, i64 %t674)
  store i64 %t675, ptr %local.w2.552
  %t676 = load i64, ptr %local.w1.551
  %t677 = load i64, ptr %local.w2.552
  %t678 = load i64, ptr %local.w3.553
  %t679 = load i64, ptr %local.base_lr.546
  %t680 = load i64, ptr %local.steps.547
  %t681 = call i64 @"mg_pid"(i64 %t676, i64 %t677, i64 %t678, i64 2, i64 %t679, i64 %t680, i64 0)
  store i64 %t681, ptr %local.mg.554
  %t682 = load i64, ptr %local.w3.553
  %t683 = load i64, ptr %local.mlr.556
  %t684 = load i64, ptr %local.mg.554
  %t685 = call i64 @"sx_f64_mul"(i64 %t683, i64 %t684)
  %t686 = call i64 @"sx_f64_sub"(i64 %t682, i64 %t685)
  %t687 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.148)
  %t688 = xor i64 %t687, -9223372036854775808
  %t689 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.149)
  %t690 = call i64 @"clamp"(i64 %t686, i64 %t688, i64 %t689)
  store i64 %t690, ptr %local.w3.553
  %t691 = load i64, ptr %local.cycle.555
  %t692 = icmp slt i64 %t691, 3
  %t693 = zext i1 %t692 to i64
  %t694 = icmp ne i64 %t693, 0
  br i1 %t694, label %then11, label %else11
then11:
  %t695 = load i64, ptr %local.w1.551
  %t696 = load i64, ptr %local.w2.552
  %t697 = load i64, ptr %local.w3.553
  %t698 = load i64, ptr %local.base_lr.546
  %t699 = load i64, ptr %local.steps.547
  %t700 = call i64 @"train_pid"(i64 %t695, i64 %t696, i64 %t697, i64 %t698, i64 %t699, i64 0)
  store i64 %t700, ptr %local.cl.557
  %t701 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.150)
  %t702 = ptrtoint ptr %t701 to i64
  %t703 = inttoptr i64 %t702 to ptr
  call void @intrinsic_print(ptr %t703)
  %t704 = load i64, ptr %local.cycle.555
  call void @print_i64(i64 %t704)
  %t705 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.151)
  %t706 = ptrtoint ptr %t705 to i64
  %t707 = inttoptr i64 %t706 to ptr
  call void @intrinsic_print(ptr %t707)
  %t708 = load i64, ptr %local.w1.551
  %t709 = call i64 @"print_f64"(i64 %t708)
  %t710 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.152)
  %t711 = ptrtoint ptr %t710 to i64
  %t712 = inttoptr i64 %t711 to ptr
  call void @intrinsic_print(ptr %t712)
  %t713 = load i64, ptr %local.w2.552
  %t714 = call i64 @"print_f64"(i64 %t713)
  %t715 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.153)
  %t716 = ptrtoint ptr %t715 to i64
  %t717 = inttoptr i64 %t716 to ptr
  call void @intrinsic_print(ptr %t717)
  %t718 = load i64, ptr %local.w3.553
  %t719 = call i64 @"print_f64"(i64 %t718)
  %t720 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.154)
  %t721 = ptrtoint ptr %t720 to i64
  %t722 = inttoptr i64 %t721 to ptr
  call void @intrinsic_print(ptr %t722)
  %t723 = load i64, ptr %local.cl.557
  %t724 = call i64 @"print_f64"(i64 %t723)
  %t725 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.155)
  %t726 = ptrtoint ptr %t725 to i64
  %t727 = inttoptr i64 %t726 to ptr
  call void @intrinsic_println(ptr %t727)
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t728 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t729 = load i64, ptr %local.cycle.555
  %t730 = icmp eq i64 %t729, 39
  %t731 = zext i1 %t730 to i64
  %t732 = icmp ne i64 %t731, 0
  br i1 %t732, label %then12, label %else12
then12:
  %t733 = load i64, ptr %local.w1.551
  %t734 = load i64, ptr %local.w2.552
  %t735 = load i64, ptr %local.w3.553
  %t736 = load i64, ptr %local.base_lr.546
  %t737 = load i64, ptr %local.steps.547
  %t738 = call i64 @"train_pid"(i64 %t733, i64 %t734, i64 %t735, i64 %t736, i64 %t737, i64 0)
  store i64 %t738, ptr %local.cl.558
  %t739 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.156)
  %t740 = ptrtoint ptr %t739 to i64
  %t741 = inttoptr i64 %t740 to ptr
  call void @intrinsic_print(ptr %t741)
  %t742 = load i64, ptr %local.w1.551
  %t743 = call i64 @"print_f64"(i64 %t742)
  %t744 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.157)
  %t745 = ptrtoint ptr %t744 to i64
  %t746 = inttoptr i64 %t745 to ptr
  call void @intrinsic_print(ptr %t746)
  %t747 = load i64, ptr %local.w2.552
  %t748 = call i64 @"print_f64"(i64 %t747)
  %t749 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.158)
  %t750 = ptrtoint ptr %t749 to i64
  %t751 = inttoptr i64 %t750 to ptr
  call void @intrinsic_print(ptr %t751)
  %t752 = load i64, ptr %local.w3.553
  %t753 = call i64 @"print_f64"(i64 %t752)
  %t754 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.159)
  %t755 = ptrtoint ptr %t754 to i64
  %t756 = inttoptr i64 %t755 to ptr
  call void @intrinsic_print(ptr %t756)
  %t757 = load i64, ptr %local.cl.558
  %t758 = call i64 @"print_f64"(i64 %t757)
  %t759 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.160)
  %t760 = ptrtoint ptr %t759 to i64
  %t761 = inttoptr i64 %t760 to ptr
  call void @intrinsic_println(ptr %t761)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t762 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t763 = load i64, ptr %local.cycle.555
  %t764 = add i64 %t763, 1
  store i64 %t764, ptr %local.cycle.555
  br label %loop10
endloop10:
  %t765 = load i64, ptr %local.w1.551
  %t766 = load i64, ptr %local.w2.552
  %t767 = load i64, ptr %local.w3.553
  %t768 = load i64, ptr %local.base_lr.546
  %t769 = load i64, ptr %local.steps.547
  %t770 = call i64 @"train_pid"(i64 %t765, i64 %t766, i64 %t767, i64 %t768, i64 %t769, i64 0)
  store i64 %t770, ptr %local.loss_learned_q.559
  %t771 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.161)
  %t772 = ptrtoint ptr %t771 to i64
  %t773 = inttoptr i64 %t772 to ptr
  call void @intrinsic_print(ptr %t773)
  %t774 = load i64, ptr %local.loss_learned_q.559
  %t775 = call i64 @"print_f64"(i64 %t774)
  %t776 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.162)
  %t777 = ptrtoint ptr %t776 to i64
  %t778 = inttoptr i64 %t777 to ptr
  call void @intrinsic_println(ptr %t778)
  %t779 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.163)
  %t780 = ptrtoint ptr %t779 to i64
  %t781 = inttoptr i64 %t780 to ptr
  call void @intrinsic_print(ptr %t781)
  %t782 = load i64, ptr %local.w1.551
  %t783 = call i64 @"print_f64"(i64 %t782)
  %t784 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.164)
  %t785 = ptrtoint ptr %t784 to i64
  %t786 = inttoptr i64 %t785 to ptr
  call void @intrinsic_print(ptr %t786)
  %t787 = load i64, ptr %local.w2.552
  %t788 = call i64 @"print_f64"(i64 %t787)
  %t789 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.165)
  %t790 = ptrtoint ptr %t789 to i64
  %t791 = inttoptr i64 %t790 to ptr
  call void @intrinsic_print(ptr %t791)
  %t792 = load i64, ptr %local.w3.553
  %t793 = call i64 @"print_f64"(i64 %t792)
  %t794 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.166)
  %t795 = ptrtoint ptr %t794 to i64
  %t796 = inttoptr i64 %t795 to ptr
  call void @intrinsic_println(ptr %t796)
  %t797 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.167)
  %t798 = ptrtoint ptr %t797 to i64
  %t799 = inttoptr i64 %t798 to ptr
  call void @intrinsic_println(ptr %t799)
  %t800 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.168)
  %t801 = ptrtoint ptr %t800 to i64
  %t802 = inttoptr i64 %t801 to ptr
  call void @intrinsic_println(ptr %t802)
  %t803 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.169)
  %t804 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.170)
  %t805 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.171)
  %t806 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.172)
  %t807 = load i64, ptr %local.steps.547
  %t808 = call i64 @"train_pid"(i64 %t803, i64 %t804, i64 %t805, i64 %t806, i64 %t807, i64 1)
  store i64 %t808, ptr %local.loss_fixed_r.560
  %t809 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.173)
  %t810 = ptrtoint ptr %t809 to i64
  %t811 = inttoptr i64 %t810 to ptr
  call void @intrinsic_print(ptr %t811)
  %t812 = load i64, ptr %local.loss_fixed_r.560
  %t813 = call i64 @"print_f64"(i64 %t812)
  %t814 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.174)
  %t815 = ptrtoint ptr %t814 to i64
  %t816 = inttoptr i64 %t815 to ptr
  call void @intrinsic_println(ptr %t816)
  %t817 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.175)
  store i64 %t817, ptr %local.rw1.561
  %t818 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.176)
  store i64 %t818, ptr %local.rw2.562
  %t819 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.177)
  store i64 %t819, ptr %local.rw3.563
  store i64 0, ptr %local.cycle.555
  br label %loop13
loop13:
  %t820 = load i64, ptr %local.cycle.555
  %t821 = icmp slt i64 %t820, 40
  %t822 = zext i1 %t821 to i64
  %t823 = icmp ne i64 %t822, 0
  br i1 %t823, label %body13, label %endloop13
body13:
  %t824 = load i64, ptr %local.rw1.561
  %t825 = load i64, ptr %local.rw2.562
  %t826 = load i64, ptr %local.rw3.563
  %t827 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.178)
  %t828 = load i64, ptr %local.steps.547
  %t829 = call i64 @"mg_pid"(i64 %t824, i64 %t825, i64 %t826, i64 0, i64 %t827, i64 %t828, i64 1)
  store i64 %t829, ptr %local.mg.554
  %t830 = load i64, ptr %local.rw1.561
  %t831 = load i64, ptr %local.mlr.556
  %t832 = load i64, ptr %local.mg.554
  %t833 = call i64 @"sx_f64_mul"(i64 %t831, i64 %t832)
  %t834 = call i64 @"sx_f64_sub"(i64 %t830, i64 %t833)
  %t835 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.179)
  %t836 = xor i64 %t835, -9223372036854775808
  %t837 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.180)
  %t838 = call i64 @"clamp"(i64 %t834, i64 %t836, i64 %t837)
  store i64 %t838, ptr %local.rw1.561
  %t839 = load i64, ptr %local.rw1.561
  %t840 = load i64, ptr %local.rw2.562
  %t841 = load i64, ptr %local.rw3.563
  %t842 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.181)
  %t843 = load i64, ptr %local.steps.547
  %t844 = call i64 @"mg_pid"(i64 %t839, i64 %t840, i64 %t841, i64 1, i64 %t842, i64 %t843, i64 1)
  store i64 %t844, ptr %local.mg.554
  %t845 = load i64, ptr %local.rw2.562
  %t846 = load i64, ptr %local.mlr.556
  %t847 = load i64, ptr %local.mg.554
  %t848 = call i64 @"sx_f64_mul"(i64 %t846, i64 %t847)
  %t849 = call i64 @"sx_f64_sub"(i64 %t845, i64 %t848)
  %t850 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.182)
  %t851 = xor i64 %t850, -9223372036854775808
  %t852 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.183)
  %t853 = call i64 @"clamp"(i64 %t849, i64 %t851, i64 %t852)
  store i64 %t853, ptr %local.rw2.562
  %t854 = load i64, ptr %local.rw1.561
  %t855 = load i64, ptr %local.rw2.562
  %t856 = load i64, ptr %local.rw3.563
  %t857 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.184)
  %t858 = load i64, ptr %local.steps.547
  %t859 = call i64 @"mg_pid"(i64 %t854, i64 %t855, i64 %t856, i64 2, i64 %t857, i64 %t858, i64 1)
  store i64 %t859, ptr %local.mg.554
  %t860 = load i64, ptr %local.rw3.563
  %t861 = load i64, ptr %local.mlr.556
  %t862 = load i64, ptr %local.mg.554
  %t863 = call i64 @"sx_f64_mul"(i64 %t861, i64 %t862)
  %t864 = call i64 @"sx_f64_sub"(i64 %t860, i64 %t863)
  %t865 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.185)
  %t866 = xor i64 %t865, -9223372036854775808
  %t867 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.186)
  %t868 = call i64 @"clamp"(i64 %t864, i64 %t866, i64 %t867)
  store i64 %t868, ptr %local.rw3.563
  %t869 = load i64, ptr %local.cycle.555
  %t870 = add i64 %t869, 1
  store i64 %t870, ptr %local.cycle.555
  br label %loop13
endloop13:
  %t871 = load i64, ptr %local.rw1.561
  %t872 = load i64, ptr %local.rw2.562
  %t873 = load i64, ptr %local.rw3.563
  %t874 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.187)
  %t875 = load i64, ptr %local.steps.547
  %t876 = call i64 @"train_pid"(i64 %t871, i64 %t872, i64 %t873, i64 %t874, i64 %t875, i64 1)
  store i64 %t876, ptr %local.loss_learned_r.564
  %t877 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.188)
  %t878 = ptrtoint ptr %t877 to i64
  %t879 = inttoptr i64 %t878 to ptr
  call void @intrinsic_print(ptr %t879)
  %t880 = load i64, ptr %local.loss_learned_r.564
  %t881 = call i64 @"print_f64"(i64 %t880)
  %t882 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.189)
  %t883 = ptrtoint ptr %t882 to i64
  %t884 = inttoptr i64 %t883 to ptr
  call void @intrinsic_println(ptr %t884)
  %t885 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.190)
  %t886 = ptrtoint ptr %t885 to i64
  %t887 = inttoptr i64 %t886 to ptr
  call void @intrinsic_print(ptr %t887)
  %t888 = load i64, ptr %local.rw1.561
  %t889 = call i64 @"print_f64"(i64 %t888)
  %t890 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.191)
  %t891 = ptrtoint ptr %t890 to i64
  %t892 = inttoptr i64 %t891 to ptr
  call void @intrinsic_print(ptr %t892)
  %t893 = load i64, ptr %local.rw2.562
  %t894 = call i64 @"print_f64"(i64 %t893)
  %t895 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.192)
  %t896 = ptrtoint ptr %t895 to i64
  %t897 = inttoptr i64 %t896 to ptr
  call void @intrinsic_print(ptr %t897)
  %t898 = load i64, ptr %local.rw3.563
  %t899 = call i64 @"print_f64"(i64 %t898)
  %t900 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.193)
  %t901 = ptrtoint ptr %t900 to i64
  %t902 = inttoptr i64 %t901 to ptr
  call void @intrinsic_println(ptr %t902)
  %t903 = load i64, ptr %local.rw1.561
  %t904 = load i64, ptr %local.w1.551
  %t905 = call i64 @"sx_f64_sub"(i64 %t903, i64 %t904)
  %t906 = call i64 @"abs_f64"(i64 %t905)
  %t907 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.194)
  %t908 = call i64 @"sx_f64_gt"(i64 %t906, i64 %t907)
  %t909 = icmp ne i64 %t908, 0
  br i1 %t909, label %then14, label %else14
then14:
  %t910 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.195)
  %t911 = ptrtoint ptr %t910 to i64
  %t912 = inttoptr i64 %t911 to ptr
  call void @intrinsic_println(ptr %t912)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  %t913 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.196)
  %t914 = ptrtoint ptr %t913 to i64
  %t915 = inttoptr i64 %t914 to ptr
  call void @intrinsic_println(ptr %t915)
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t916 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t917 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.197)
  %t918 = ptrtoint ptr %t917 to i64
  %t919 = inttoptr i64 %t918 to ptr
  call void @intrinsic_println(ptr %t919)
  %t920 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.198)
  %t921 = ptrtoint ptr %t920 to i64
  %t922 = inttoptr i64 %t921 to ptr
  call void @intrinsic_println(ptr %t922)
  %t923 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.199)
  %t924 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.200)
  %t925 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.201)
  %t926 = load i64, ptr %local.base_lr.546
  %t927 = load i64, ptr %local.steps.547
  %t928 = call i64 @"train_pid"(i64 %t923, i64 %t924, i64 %t925, i64 %t926, i64 %t927, i64 0)
  store i64 %t928, ptr %local.loss_none.565
  %t929 = load i64, ptr %local.w1.551
  %t930 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.202)
  %t931 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.203)
  %t932 = load i64, ptr %local.base_lr.546
  %t933 = load i64, ptr %local.steps.547
  %t934 = call i64 @"train_pid"(i64 %t929, i64 %t930, i64 %t931, i64 %t932, i64 %t933, i64 0)
  store i64 %t934, ptr %local.loss_p.566
  %t935 = load i64, ptr %local.w1.551
  %t936 = load i64, ptr %local.w2.552
  %t937 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.204)
  %t938 = load i64, ptr %local.base_lr.546
  %t939 = load i64, ptr %local.steps.547
  %t940 = call i64 @"train_pid"(i64 %t935, i64 %t936, i64 %t937, i64 %t938, i64 %t939, i64 0)
  store i64 %t940, ptr %local.loss_pd.567
  %t941 = load i64, ptr %local.w1.551
  %t942 = load i64, ptr %local.w2.552
  %t943 = load i64, ptr %local.w3.553
  %t944 = load i64, ptr %local.base_lr.546
  %t945 = load i64, ptr %local.steps.547
  %t946 = call i64 @"train_pid"(i64 %t941, i64 %t942, i64 %t943, i64 %t944, i64 %t945, i64 0)
  store i64 %t946, ptr %local.loss_pid.568
  %t947 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.205)
  %t948 = ptrtoint ptr %t947 to i64
  %t949 = inttoptr i64 %t948 to ptr
  call void @intrinsic_println(ptr %t949)
  %t950 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.206)
  %t951 = ptrtoint ptr %t950 to i64
  %t952 = inttoptr i64 %t951 to ptr
  call void @intrinsic_print(ptr %t952)
  %t953 = load i64, ptr %local.loss_none.565
  %t954 = call i64 @"print_f64"(i64 %t953)
  %t955 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.207)
  %t956 = ptrtoint ptr %t955 to i64
  %t957 = inttoptr i64 %t956 to ptr
  call void @intrinsic_println(ptr %t957)
  %t958 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.208)
  %t959 = ptrtoint ptr %t958 to i64
  %t960 = inttoptr i64 %t959 to ptr
  call void @intrinsic_print(ptr %t960)
  %t961 = load i64, ptr %local.loss_p.566
  %t962 = call i64 @"print_f64"(i64 %t961)
  %t963 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.209)
  %t964 = ptrtoint ptr %t963 to i64
  %t965 = inttoptr i64 %t964 to ptr
  call void @intrinsic_print(ptr %t965)
  %t966 = load i64, ptr %local.loss_none.565
  %t967 = load i64, ptr %local.loss_p.566
  %t968 = call i64 @"sx_f64_sub"(i64 %t966, i64 %t967)
  %t969 = call i64 @"print_f64"(i64 %t968)
  %t970 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.210)
  %t971 = ptrtoint ptr %t970 to i64
  %t972 = inttoptr i64 %t971 to ptr
  call void @intrinsic_println(ptr %t972)
  %t973 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.211)
  %t974 = ptrtoint ptr %t973 to i64
  %t975 = inttoptr i64 %t974 to ptr
  call void @intrinsic_print(ptr %t975)
  %t976 = load i64, ptr %local.loss_pd.567
  %t977 = call i64 @"print_f64"(i64 %t976)
  %t978 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.212)
  %t979 = ptrtoint ptr %t978 to i64
  %t980 = inttoptr i64 %t979 to ptr
  call void @intrinsic_print(ptr %t980)
  %t981 = load i64, ptr %local.loss_none.565
  %t982 = load i64, ptr %local.loss_pd.567
  %t983 = call i64 @"sx_f64_sub"(i64 %t981, i64 %t982)
  %t984 = call i64 @"print_f64"(i64 %t983)
  %t985 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.213)
  %t986 = ptrtoint ptr %t985 to i64
  %t987 = inttoptr i64 %t986 to ptr
  call void @intrinsic_println(ptr %t987)
  %t988 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.214)
  %t989 = ptrtoint ptr %t988 to i64
  %t990 = inttoptr i64 %t989 to ptr
  call void @intrinsic_print(ptr %t990)
  %t991 = load i64, ptr %local.loss_pid.568
  %t992 = call i64 @"print_f64"(i64 %t991)
  %t993 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.215)
  %t994 = ptrtoint ptr %t993 to i64
  %t995 = inttoptr i64 %t994 to ptr
  call void @intrinsic_print(ptr %t995)
  %t996 = load i64, ptr %local.loss_none.565
  %t997 = load i64, ptr %local.loss_pid.568
  %t998 = call i64 @"sx_f64_sub"(i64 %t996, i64 %t997)
  %t999 = call i64 @"print_f64"(i64 %t998)
  %t1000 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.216)
  %t1001 = ptrtoint ptr %t1000 to i64
  %t1002 = inttoptr i64 %t1001 to ptr
  call void @intrinsic_println(ptr %t1002)
  %t1003 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.217)
  %t1004 = ptrtoint ptr %t1003 to i64
  %t1005 = inttoptr i64 %t1004 to ptr
  call void @intrinsic_println(ptr %t1005)
  %t1006 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.218)
  %t1007 = ptrtoint ptr %t1006 to i64
  %t1008 = inttoptr i64 %t1007 to ptr
  call void @intrinsic_println(ptr %t1008)
  %t1009 = load i64, ptr %local.w1.551
  %t1010 = load i64, ptr %local.w2.552
  %t1011 = load i64, ptr %local.w3.553
  %t1012 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.219)
  %t1013 = load i64, ptr %local.steps.547
  %t1014 = call i64 @"train_pid"(i64 %t1009, i64 %t1010, i64 %t1011, i64 %t1012, i64 %t1013, i64 0)
  store i64 %t1014, ptr %local.loss_transfer_001.569
  %t1015 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.220)
  %t1016 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.221)
  %t1017 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.222)
  %t1018 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.223)
  %t1019 = load i64, ptr %local.steps.547
  %t1020 = call i64 @"train_pid"(i64 %t1015, i64 %t1016, i64 %t1017, i64 %t1018, i64 %t1019, i64 0)
  store i64 %t1020, ptr %local.loss_fixed_001.570
  %t1021 = load i64, ptr %local.w1.551
  %t1022 = load i64, ptr %local.w2.552
  %t1023 = load i64, ptr %local.w3.553
  %t1024 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.224)
  %t1025 = load i64, ptr %local.steps.547
  %t1026 = call i64 @"train_pid"(i64 %t1021, i64 %t1022, i64 %t1023, i64 %t1024, i64 %t1025, i64 0)
  store i64 %t1026, ptr %local.loss_transfer_05.571
  %t1027 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.225)
  %t1028 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.226)
  %t1029 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.227)
  %t1030 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.228)
  %t1031 = load i64, ptr %local.steps.547
  %t1032 = call i64 @"train_pid"(i64 %t1027, i64 %t1028, i64 %t1029, i64 %t1030, i64 %t1031, i64 0)
  store i64 %t1032, ptr %local.loss_fixed_05.572
  %t1033 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.229)
  %t1034 = ptrtoint ptr %t1033 to i64
  %t1035 = inttoptr i64 %t1034 to ptr
  call void @intrinsic_println(ptr %t1035)
  %t1036 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.230)
  %t1037 = ptrtoint ptr %t1036 to i64
  %t1038 = inttoptr i64 %t1037 to ptr
  call void @intrinsic_print(ptr %t1038)
  %t1039 = load i64, ptr %local.loss_fixed_001.570
  %t1040 = call i64 @"print_f64"(i64 %t1039)
  %t1041 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.231)
  %t1042 = ptrtoint ptr %t1041 to i64
  %t1043 = inttoptr i64 %t1042 to ptr
  call void @intrinsic_print(ptr %t1043)
  %t1044 = load i64, ptr %local.loss_transfer_001.569
  %t1045 = call i64 @"print_f64"(i64 %t1044)
  %t1046 = load i64, ptr %local.loss_transfer_001.569
  %t1047 = load i64, ptr %local.loss_fixed_001.570
  %t1048 = call i64 @"sx_f64_lt"(i64 %t1046, i64 %t1047)
  %t1049 = icmp ne i64 %t1048, 0
  br i1 %t1049, label %then15, label %else15
then15:
  %t1050 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.232)
  %t1051 = ptrtoint ptr %t1050 to i64
  %t1052 = inttoptr i64 %t1051 to ptr
  call void @intrinsic_println(ptr %t1052)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  %t1053 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.233)
  %t1054 = ptrtoint ptr %t1053 to i64
  %t1055 = inttoptr i64 %t1054 to ptr
  call void @intrinsic_println(ptr %t1055)
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t1056 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t1057 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.234)
  %t1058 = ptrtoint ptr %t1057 to i64
  %t1059 = inttoptr i64 %t1058 to ptr
  call void @intrinsic_print(ptr %t1059)
  %t1060 = load i64, ptr %local.loss_fixed_05.572
  %t1061 = call i64 @"print_f64"(i64 %t1060)
  %t1062 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.235)
  %t1063 = ptrtoint ptr %t1062 to i64
  %t1064 = inttoptr i64 %t1063 to ptr
  call void @intrinsic_print(ptr %t1064)
  %t1065 = load i64, ptr %local.loss_transfer_05.571
  %t1066 = call i64 @"print_f64"(i64 %t1065)
  %t1067 = load i64, ptr %local.loss_transfer_05.571
  %t1068 = load i64, ptr %local.loss_fixed_05.572
  %t1069 = call i64 @"sx_f64_lt"(i64 %t1067, i64 %t1068)
  %t1070 = icmp ne i64 %t1069, 0
  br i1 %t1070, label %then16, label %else16
then16:
  %t1071 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.236)
  %t1072 = ptrtoint ptr %t1071 to i64
  %t1073 = inttoptr i64 %t1072 to ptr
  call void @intrinsic_println(ptr %t1073)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  %t1074 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.237)
  %t1075 = ptrtoint ptr %t1074 to i64
  %t1076 = inttoptr i64 %t1075 to ptr
  call void @intrinsic_println(ptr %t1076)
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t1077 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t1078 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.238)
  %t1079 = ptrtoint ptr %t1078 to i64
  %t1080 = inttoptr i64 %t1079 to ptr
  call void @intrinsic_println(ptr %t1080)
  %t1081 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.239)
  %t1082 = ptrtoint ptr %t1081 to i64
  %t1083 = inttoptr i64 %t1082 to ptr
  call void @intrinsic_println(ptr %t1083)
  %t1084 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.240)
  %t1085 = ptrtoint ptr %t1084 to i64
  %t1086 = inttoptr i64 %t1085 to ptr
  call void @intrinsic_println(ptr %t1086)
  %t1087 = load i64, ptr %local.w1.551
  %t1088 = load i64, ptr %local.w2.552
  %t1089 = load i64, ptr %local.w3.553
  %t1090 = load i64, ptr %local.base_lr.546
  %t1091 = call i64 @"train_pid"(i64 %t1087, i64 %t1088, i64 %t1089, i64 %t1090, i64 250, i64 0)
  store i64 %t1091, ptr %local.loss_first_half.573
  %t1092 = load i64, ptr %local.w1.551
  %t1093 = load i64, ptr %local.w2.552
  %t1094 = load i64, ptr %local.w3.553
  %t1095 = load i64, ptr %local.base_lr.546
  %t1096 = call i64 @f64_parse(ptr @.str.exp_pid_metagradient.241)
  %t1097 = call i64 @"sx_f64_mul"(i64 %t1095, i64 %t1096)
  %t1098 = call i64 @"train_pid"(i64 %t1092, i64 %t1093, i64 %t1094, i64 %t1097, i64 250, i64 0)
  store i64 %t1098, ptr %local.loss_second_half.574
  %t1099 = load i64, ptr %local.w1.551
  %t1100 = load i64, ptr %local.w2.552
  %t1101 = load i64, ptr %local.w3.553
  %t1102 = load i64, ptr %local.base_lr.546
  %t1103 = call i64 @"train_pid"(i64 %t1099, i64 %t1100, i64 %t1101, i64 %t1102, i64 500, i64 0)
  store i64 %t1103, ptr %local.loss_full.575
  %t1104 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.242)
  %t1105 = ptrtoint ptr %t1104 to i64
  %t1106 = inttoptr i64 %t1105 to ptr
  call void @intrinsic_print(ptr %t1106)
  %t1107 = load i64, ptr %local.loss_full.575
  %t1108 = call i64 @"print_f64"(i64 %t1107)
  %t1109 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.243)
  %t1110 = ptrtoint ptr %t1109 to i64
  %t1111 = inttoptr i64 %t1110 to ptr
  call void @intrinsic_println(ptr %t1111)
  %t1112 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.244)
  %t1113 = ptrtoint ptr %t1112 to i64
  %t1114 = inttoptr i64 %t1113 to ptr
  call void @intrinsic_print(ptr %t1114)
  %t1115 = load i64, ptr %local.loss_first_half.573
  %t1116 = call i64 @"print_f64"(i64 %t1115)
  %t1117 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.245)
  %t1118 = ptrtoint ptr %t1117 to i64
  %t1119 = inttoptr i64 %t1118 to ptr
  call void @intrinsic_println(ptr %t1119)
  %t1120 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.246)
  %t1121 = ptrtoint ptr %t1120 to i64
  %t1122 = inttoptr i64 %t1121 to ptr
  call void @intrinsic_print(ptr %t1122)
  %t1123 = load i64, ptr %local.loss_second_half.574
  %t1124 = call i64 @"print_f64"(i64 %t1123)
  %t1125 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.247)
  %t1126 = ptrtoint ptr %t1125 to i64
  %t1127 = inttoptr i64 %t1126 to ptr
  call void @intrinsic_println(ptr %t1127)
  %t1128 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.248)
  %t1129 = ptrtoint ptr %t1128 to i64
  %t1130 = inttoptr i64 %t1129 to ptr
  call void @intrinsic_println(ptr %t1130)
  %t1131 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.249)
  %t1132 = ptrtoint ptr %t1131 to i64
  %t1133 = inttoptr i64 %t1132 to ptr
  call void @intrinsic_println(ptr %t1133)
  %t1134 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.250)
  %t1135 = ptrtoint ptr %t1134 to i64
  %t1136 = inttoptr i64 %t1135 to ptr
  call void @intrinsic_println(ptr %t1136)
  %t1137 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.251)
  %t1138 = ptrtoint ptr %t1137 to i64
  %t1139 = inttoptr i64 %t1138 to ptr
  call void @intrinsic_println(ptr %t1139)
  %t1140 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.252)
  %t1141 = ptrtoint ptr %t1140 to i64
  %t1142 = inttoptr i64 %t1141 to ptr
  call void @intrinsic_println(ptr %t1142)
  %t1143 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.253)
  %t1144 = ptrtoint ptr %t1143 to i64
  %t1145 = inttoptr i64 %t1144 to ptr
  call void @intrinsic_println(ptr %t1145)
  %t1146 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.254)
  %t1147 = ptrtoint ptr %t1146 to i64
  %t1148 = inttoptr i64 %t1147 to ptr
  call void @intrinsic_println(ptr %t1148)
  %t1149 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.255)
  %t1150 = ptrtoint ptr %t1149 to i64
  %t1151 = inttoptr i64 %t1150 to ptr
  call void @intrinsic_println(ptr %t1151)
  %t1152 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.256)
  %t1153 = ptrtoint ptr %t1152 to i64
  %t1154 = inttoptr i64 %t1153 to ptr
  call void @intrinsic_println(ptr %t1154)
  %t1155 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.257)
  %t1156 = ptrtoint ptr %t1155 to i64
  %t1157 = inttoptr i64 %t1156 to ptr
  call void @intrinsic_println(ptr %t1157)
  %t1158 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.258)
  %t1159 = ptrtoint ptr %t1158 to i64
  %t1160 = inttoptr i64 %t1159 to ptr
  call void @intrinsic_println(ptr %t1160)
  %t1161 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.259)
  %t1162 = ptrtoint ptr %t1161 to i64
  %t1163 = inttoptr i64 %t1162 to ptr
  call void @intrinsic_println(ptr %t1163)
  %t1164 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.260)
  %t1165 = ptrtoint ptr %t1164 to i64
  %t1166 = inttoptr i64 %t1165 to ptr
  call void @intrinsic_println(ptr %t1166)
  %t1167 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.261)
  %t1168 = ptrtoint ptr %t1167 to i64
  %t1169 = inttoptr i64 %t1168 to ptr
  call void @intrinsic_println(ptr %t1169)
  %t1170 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_metagradient.262)
  %t1171 = ptrtoint ptr %t1170 to i64
  %t1172 = inttoptr i64 %t1171 to ptr
  call void @intrinsic_println(ptr %t1172)
  ret i64 0
}


; String constants
@.str.exp_pid_metagradient.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.6 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_pid_metagradient.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.19 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_pid_metagradient.20 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.21 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_pid_metagradient.22 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.23 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.24 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.25 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.26 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.27 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.28 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.29 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.30 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.31 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.32 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.33 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.34 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.35 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.36 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_metagradient.37 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.38 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_metagradient.39 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.40 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.41 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.42 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.43 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.44 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.45 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_pid_metagradient.46 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.47 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.48 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.49 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.50 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_pid_metagradient.51 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.52 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.53 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.54 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.55 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_pid_metagradient.56 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.57 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.58 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.59 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.60 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_pid_metagradient.61 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.62 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.63 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.64 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.65 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_pid_metagradient.66 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.67 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.68 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.69 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.70 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_pid_metagradient.71 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.72 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.73 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.74 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.75 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_pid_metagradient.76 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.77 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.78 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.79 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.80 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_pid_metagradient.81 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.82 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.83 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.84 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.85 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.86 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.87 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_pid_metagradient.88 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_pid_metagradient.89 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.90 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.91 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.92 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.93 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_metagradient.94 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_metagradient.95 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.96 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.97 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.98 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.99 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.100 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.101 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.102 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.103 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.104 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.105 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_metagradient.106 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_metagradient.107 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.108 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.109 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_pid_metagradient.110 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.111 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.112 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_metagradient.113 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_pid_metagradient.114 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_metagradient.115 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_pid_metagradient.116 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.117 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_pid_metagradient.118 = private unnamed_addr constant [45 x i8] c"#  PID CONTROLLER WITH LEARNABLE GAINS     #\00"
@.str.exp_pid_metagradient.119 = private unnamed_addr constant [45 x i8] c"#  via Meta-Gradient on S, S', S''         #\00"
@.str.exp_pid_metagradient.120 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_pid_metagradient.121 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.122 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_pid_metagradient.123 = private unnamed_addr constant [46 x i8] c"=== Exp 1: Quadratic — Learn w1, w2, w3 ===\00"
@.str.exp_pid_metagradient.124 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.125 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.126 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.127 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_pid_metagradient.128 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.129 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.130 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_pid_metagradient.131 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_pid_metagradient.132 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.133 = private unnamed_addr constant [28 x i8] c"  Fixed lr (w=0,0,0):      \00"
@.str.exp_pid_metagradient.134 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.135 = private unnamed_addr constant [28 x i8] c"  S-only (w=0.5,0,0):      \00"
@.str.exp_pid_metagradient.136 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.137 = private unnamed_addr constant [28 x i8] c"  S+S' (w=0.5,0.3,0):      \00"
@.str.exp_pid_metagradient.138 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.139 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_pid_metagradient.140 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.141 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.142 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.143 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_pid_metagradient.144 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.145 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.146 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.147 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.148 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.149 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.150 = private unnamed_addr constant [9 x i8] c"  cycle \00"
@.str.exp_pid_metagradient.151 = private unnamed_addr constant [6 x i8] c": w=(\00"
@.str.exp_pid_metagradient.152 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_pid_metagradient.153 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_pid_metagradient.154 = private unnamed_addr constant [8 x i8] c") loss=\00"
@.str.exp_pid_metagradient.155 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.156 = private unnamed_addr constant [16 x i8] c"  cycle 39: w=(\00"
@.str.exp_pid_metagradient.157 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_pid_metagradient.158 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_pid_metagradient.159 = private unnamed_addr constant [8 x i8] c") loss=\00"
@.str.exp_pid_metagradient.160 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.161 = private unnamed_addr constant [28 x i8] c"  LEARNED PID:             \00"
@.str.exp_pid_metagradient.162 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.163 = private unnamed_addr constant [13 x i8] c"  Gains: w1=\00"
@.str.exp_pid_metagradient.164 = private unnamed_addr constant [5 x i8] c" w2=\00"
@.str.exp_pid_metagradient.165 = private unnamed_addr constant [5 x i8] c" w3=\00"
@.str.exp_pid_metagradient.166 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.167 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.168 = private unnamed_addr constant [53 x i8] c"=== Exp 2: Rastrigin — Different gains needed? ===\00"
@.str.exp_pid_metagradient.169 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.170 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.171 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.172 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_pid_metagradient.173 = private unnamed_addr constant [28 x i8] c"  Fixed lr (Rastrigin):    \00"
@.str.exp_pid_metagradient.174 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.175 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_pid_metagradient.176 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.177 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.178 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_pid_metagradient.179 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.180 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.181 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_pid_metagradient.182 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.183 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.184 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_pid_metagradient.185 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.186 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_metagradient.187 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_pid_metagradient.188 = private unnamed_addr constant [28 x i8] c"  LEARNED PID (Rastrigin): \00"
@.str.exp_pid_metagradient.189 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.190 = private unnamed_addr constant [13 x i8] c"  Gains: w1=\00"
@.str.exp_pid_metagradient.191 = private unnamed_addr constant [5 x i8] c" w2=\00"
@.str.exp_pid_metagradient.192 = private unnamed_addr constant [5 x i8] c" w3=\00"
@.str.exp_pid_metagradient.193 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.194 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_pid_metagradient.195 = private unnamed_addr constant [58 x i8] c"  FINDING: Rastrigin needs DIFFERENT gains than quadratic\00"
@.str.exp_pid_metagradient.196 = private unnamed_addr constant [38 x i8] c"  Gains are similar across landscapes\00"
@.str.exp_pid_metagradient.197 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.198 = private unnamed_addr constant [50 x i8] c"=== Exp 3: Ablation — S vs S+S' vs S+S'+S'' ===\00"
@.str.exp_pid_metagradient.199 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.200 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.201 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.202 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.203 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.204 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.205 = private unnamed_addr constant [40 x i8] c"  Controller    Loss        Improvement\00"
@.str.exp_pid_metagradient.206 = private unnamed_addr constant [17 x i8] c"  None (fixed): \00"
@.str.exp_pid_metagradient.207 = private unnamed_addr constant [11 x i8] c"  baseline\00"
@.str.exp_pid_metagradient.208 = private unnamed_addr constant [17 x i8] c"  P only (S):   \00"
@.str.exp_pid_metagradient.209 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_pid_metagradient.210 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.211 = private unnamed_addr constant [17 x i8] c"  PD (S+S'):    \00"
@.str.exp_pid_metagradient.212 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_pid_metagradient.213 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.214 = private unnamed_addr constant [18 x i8] c"  PID (S+S'+S''):\00"
@.str.exp_pid_metagradient.215 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_pid_metagradient.216 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.217 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.218 = private unnamed_addr constant [57 x i8] c"=== Exp 4: Transfer — Learned gains on new problem ===\00"
@.str.exp_pid_metagradient.219 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_pid_metagradient.220 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.221 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.222 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.223 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_pid_metagradient.224 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_pid_metagradient.225 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.226 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.227 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_metagradient.228 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_pid_metagradient.229 = private unnamed_addr constant [54 x i8] c"  base_lr    Fixed        PID(transferred)  PID_wins?\00"
@.str.exp_pid_metagradient.230 = private unnamed_addr constant [14 x i8] c"  0.001      \00"
@.str.exp_pid_metagradient.231 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_pid_metagradient.232 = private unnamed_addr constant [6 x i8] c"  YES\00"
@.str.exp_pid_metagradient.233 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_pid_metagradient.234 = private unnamed_addr constant [14 x i8] c"  0.05       \00"
@.str.exp_pid_metagradient.235 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_pid_metagradient.236 = private unnamed_addr constant [6 x i8] c"  YES\00"
@.str.exp_pid_metagradient.237 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_pid_metagradient.238 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.239 = private unnamed_addr constant [63 x i8] c"=== Exp 5: Regime Change — Landscape shifts mid-training ===\00"
@.str.exp_pid_metagradient.240 = private unnamed_addr constant [63 x i8] c"  (Using quadratic for first 250 steps, reporting loss at end)\00"
@.str.exp_pid_metagradient.241 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_pid_metagradient.242 = private unnamed_addr constant [26 x i8] c"  Full run (stable):     \00"
@.str.exp_pid_metagradient.243 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.244 = private unnamed_addr constant [26 x i8] c"  First 250 steps:       \00"
@.str.exp_pid_metagradient.245 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.246 = private unnamed_addr constant [26 x i8] c"  Second 250 (lr/10):    \00"
@.str.exp_pid_metagradient.247 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.248 = private unnamed_addr constant [59 x i8] c"  PID gains should detect the lr change via S'' and adapt.\00"
@.str.exp_pid_metagradient.249 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_metagradient.250 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_pid_metagradient.251 = private unnamed_addr constant [45 x i8] c"#  SUMMARY                                 #\00"
@.str.exp_pid_metagradient.252 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_pid_metagradient.253 = private unnamed_addr constant [45 x i8] c"#  PID gains w1,w2,w3 are LEARNABLE via    #\00"
@.str.exp_pid_metagradient.254 = private unnamed_addr constant [46 x i8] c"#  meta-gradient. Each gain has a role:     #\00"
@.str.exp_pid_metagradient.255 = private unnamed_addr constant [47 x i8] c"#    w1 (S):   proportional — how far      #\00"
@.str.exp_pid_metagradient.256 = private unnamed_addr constant [48 x i8] c"#    w2 (S'):  derivative — how fast        #\00"
@.str.exp_pid_metagradient.257 = private unnamed_addr constant [48 x i8] c"#    w3 (S''): second deriv — overshoot     #\00"
@.str.exp_pid_metagradient.258 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_pid_metagradient.259 = private unnamed_addr constant [46 x i8] c"#  This is classical PID control theory     #\00"
@.str.exp_pid_metagradient.260 = private unnamed_addr constant [46 x i8] c"#  unified with dual-number meta-gradients. #\00"
@.str.exp_pid_metagradient.261 = private unnamed_addr constant [46 x i8] c"#  The gains are discovered, not hand-tuned.#\00"
@.str.exp_pid_metagradient.262 = private unnamed_addr constant [45 x i8] c"############################################\00"
