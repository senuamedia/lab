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
  %t1 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"my_sqrt"(i64 %x) nounwind {
entry:
  %local.g.9 = alloca i64
  %local.i.10 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t11 = load i64, ptr %local.x
  %t12 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.2)
  %t13 = call i64 @"sx_f64_le"(i64 %t11, i64 %t12)
  %t14 = icmp ne i64 %t13, 0
  br i1 %t14, label %then1, label %else1
then1:
  %t15 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.3)
  ret i64 %t15
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t16 = phi i64 [ 0, %else1_end ]
  %t17 = load i64, ptr %local.x
  store i64 %t17, ptr %local.g.9
  store i64 0, ptr %local.i.10
  br label %loop2
loop2:
  %t18 = load i64, ptr %local.i.10
  %t19 = icmp slt i64 %t18, 30
  %t20 = zext i1 %t19 to i64
  %t21 = icmp ne i64 %t20, 0
  br i1 %t21, label %body2, label %endloop2
body2:
  %t22 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.4)
  %t23 = load i64, ptr %local.g.9
  %t24 = load i64, ptr %local.x
  %t25 = load i64, ptr %local.g.9
  %t26 = call i64 @"sx_f64_div"(i64 %t24, i64 %t25)
  %t27 = call i64 @"sx_f64_add"(i64 %t23, i64 %t26)
  %t28 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t27)
  store i64 %t28, ptr %local.g.9
  %t29 = load i64, ptr %local.i.10
  %t30 = add i64 %t29, 1
  store i64 %t30, ptr %local.i.10
  br label %loop2
endloop2:
  %t31 = load i64, ptr %local.g.9
  ret i64 %t31
}

define i64 @"vfill"(i64 %n, i64 %val) nounwind {
entry:
  %local.v.32 = alloca i64
  %local.i.33 = alloca i64
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %local.val = alloca i64
  store i64 %val, ptr %local.val
  %t34 = call ptr @intrinsic_vec_new()
  %t35 = ptrtoint ptr %t34 to i64
  store i64 %t35, ptr %local.v.32
  store i64 0, ptr %local.i.33
  br label %loop3
loop3:
  %t36 = load i64, ptr %local.i.33
  %t37 = load i64, ptr %local.n
  %t38 = icmp slt i64 %t36, %t37
  %t39 = zext i1 %t38 to i64
  %t40 = icmp ne i64 %t39, 0
  br i1 %t40, label %body3, label %endloop3
body3:
  %t41 = load i64, ptr %local.v.32
  %t42 = load i64, ptr %local.val
  %t43 = call i64 @"f64_to_bits"(i64 %t42)
  %t44 = inttoptr i64 %t41 to ptr
  %t45 = inttoptr i64 %t43 to ptr
  call void @intrinsic_vec_push(ptr %t44, ptr %t45)
  %t46 = load i64, ptr %local.i.33
  %t47 = add i64 %t46, 1
  store i64 %t47, ptr %local.i.33
  br label %loop3
endloop3:
  %t48 = load i64, ptr %local.v.32
  ret i64 %t48
}

define i64 @"vget"(i64 %v, i64 %i) nounwind {
entry:
  %local.v = alloca i64
  store i64 %v, ptr %local.v
  %local.i = alloca i64
  store i64 %i, ptr %local.i
  %t49 = load i64, ptr %local.v
  %t50 = load i64, ptr %local.i
  %t51 = inttoptr i64 %t49 to ptr
  %t52 = call ptr @intrinsic_vec_get(ptr %t51, i64 %t50)
  %t53 = ptrtoint ptr %t52 to i64
  %t54 = call i64 @"bits_to_f64"(i64 %t53)
  ret i64 %t54
}

define i64 @"vset"(i64 %v, i64 %i, i64 %val) nounwind {
entry:
  %local.v = alloca i64
  store i64 %v, ptr %local.v
  %local.i = alloca i64
  store i64 %i, ptr %local.i
  %local.val = alloca i64
  store i64 %val, ptr %local.val
  %t55 = load i64, ptr %local.v
  %t56 = load i64, ptr %local.i
  %t57 = load i64, ptr %local.val
  %t58 = call i64 @"f64_to_bits"(i64 %t57)
  %t59 = inttoptr i64 %t55 to ptr
  %t60 = inttoptr i64 %t58 to ptr
  call void @intrinsic_vec_set(ptr %t59, i64 %t56, ptr %t60)
  ret i64 0
}

define i64 @"decay_adj"(i64 %n) nounwind {
entry:
  %local.r.61 = alloca i64
  %local.i.62 = alloca i64
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t63 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.5)
  store i64 %t63, ptr %local.r.61
  store i64 0, ptr %local.i.62
  br label %loop4
loop4:
  %t64 = load i64, ptr %local.i.62
  %t65 = load i64, ptr %local.n
  %t66 = icmp slt i64 %t64, %t65
  %t67 = zext i1 %t66 to i64
  %t68 = icmp ne i64 %t67, 0
  br i1 %t68, label %body4, label %endloop4
body4:
  %t69 = load i64, ptr %local.r.61
  %t70 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.6)
  %t71 = call i64 @"sx_f64_mul"(i64 %t69, i64 %t70)
  store i64 %t71, ptr %local.r.61
  %t72 = load i64, ptr %local.i.62
  %t73 = add i64 %t72, 1
  store i64 %t73, ptr %local.i.62
  br label %loop4
endloop4:
  %t74 = load i64, ptr %local.r.61
  ret i64 %t74
}

define i64 @"decay_skip"(i64 %n) nounwind {
entry:
  %local.r.75 = alloca i64
  %local.i.76 = alloca i64
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t77 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.7)
  store i64 %t77, ptr %local.r.75
  store i64 0, ptr %local.i.76
  br label %loop5
loop5:
  %t78 = load i64, ptr %local.i.76
  %t79 = load i64, ptr %local.n
  %t80 = icmp slt i64 %t78, %t79
  %t81 = zext i1 %t80 to i64
  %t82 = icmp ne i64 %t81, 0
  br i1 %t82, label %body5, label %endloop5
body5:
  %t83 = load i64, ptr %local.r.75
  %t84 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.8)
  %t85 = call i64 @"sx_f64_mul"(i64 %t83, i64 %t84)
  store i64 %t85, ptr %local.r.75
  %t86 = load i64, ptr %local.i.76
  %t87 = add i64 %t86, 1
  store i64 %t87, ptr %local.i.76
  br label %loop5
endloop5:
  %t88 = load i64, ptr %local.r.75
  ret i64 %t88
}

define i64 @"total_enstrophy"(i64 %state, i64 %n_modes) nounwind {
entry:
  %local.sum.89 = alloca i64
  %local.i.90 = alloca i64
  %local.w.91 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %local.n_modes = alloca i64
  store i64 %n_modes, ptr %local.n_modes
  %t92 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.9)
  store i64 %t92, ptr %local.sum.89
  %t93 = load i64, ptr %local.n_modes
  store i64 %t93, ptr %local.i.90
  br label %loop6
loop6:
  %t94 = load i64, ptr %local.i.90
  %t95 = load i64, ptr %local.n_modes
  %t96 = mul i64 2, %t95
  %t97 = icmp slt i64 %t94, %t96
  %t98 = zext i1 %t97 to i64
  %t99 = icmp ne i64 %t98, 0
  br i1 %t99, label %body6, label %endloop6
body6:
  %t100 = load i64, ptr %local.state
  %t101 = load i64, ptr %local.i.90
  %t102 = call i64 @"vget"(i64 %t100, i64 %t101)
  store i64 %t102, ptr %local.w.91
  %t103 = load i64, ptr %local.sum.89
  %t104 = load i64, ptr %local.w.91
  %t105 = load i64, ptr %local.w.91
  %t106 = call i64 @"sx_f64_mul"(i64 %t104, i64 %t105)
  %t107 = call i64 @"sx_f64_add"(i64 %t103, i64 %t106)
  store i64 %t107, ptr %local.sum.89
  %t108 = load i64, ptr %local.i.90
  %t109 = add i64 %t108, 1
  store i64 %t109, ptr %local.i.90
  br label %loop6
endloop6:
  %t110 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.10)
  %t111 = load i64, ptr %local.sum.89
  %t112 = call i64 @"sx_f64_mul"(i64 %t110, i64 %t111)
  ret i64 %t112
}

define i64 @"step_n"(i64 %state, i64 %n_modes, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt) nounwind {
entry:
  %local.n2.113 = alloca i64
  %local.k_max.114 = alloca i64
  %local.new_state.115 = alloca i64
  %local.omega_sq.116 = alloca i64
  %local.i.117 = alloca i64
  %local.w.118 = alloca i64
  %local.k.119 = alloca i64
  %local.k_f.120 = alloca i64
  %local.k_sq.121 = alloca i64
  %local.ui0.122 = alloca i64
  %local.ui1.123 = alloca i64
  %local.wi0.124 = alloca i64
  %local.wi1.125 = alloca i64
  %local.u0.126 = alloca i64
  %local.u1.127 = alloca i64
  %local.w0.128 = alloca i64
  %local.w1.129 = alloca i64
  %local.diff_u0.130 = alloca i64
  %local.diff_u1.131 = alloca i64
  %local.diff_w0.132 = alloca i64
  %local.diff_w1.133 = alloca i64
  %local.coup_u0.134 = alloca i64
  %local.coup_u1.135 = alloca i64
  %local.stretch_w0.136 = alloca i64
  %local.stretch_w1.137 = alloca i64
  %local.quad_w0.138 = alloca i64
  %local.quad_w1.139 = alloca i64
  %local.cascade_w0.140 = alloca i64
  %local.cascade_w1.141 = alloca i64
  %local.src_k.142 = alloca i64
  %local.dist.143 = alloca i64
  %local.src_wi0.144 = alloca i64
  %local.src_wi1.145 = alloca i64
  %local.sw0.146 = alloca i64
  %local.sw1.147 = alloca i64
  %local.scale.148 = alloca i64
  %local.new_u0.149 = alloca i64
  %local.new_u1.150 = alloca i64
  %local.new_w0.151 = alloca i64
  %local.new_w1.152 = alloca i64
  %local._a.153 = alloca i64
  %local._b.154 = alloca i64
  %local._c.155 = alloca i64
  %local._d.156 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %local.n_modes = alloca i64
  store i64 %n_modes, ptr %local.n_modes
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %t157 = load i64, ptr %local.n_modes
  %t158 = mul i64 2, %t157
  store i64 %t158, ptr %local.n2.113
  %t159 = load i64, ptr %local.n_modes
  %t160 = sdiv i64 %t159, 2
  store i64 %t160, ptr %local.k_max.114
  %t161 = load i64, ptr %local.n2.113
  %t162 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.11)
  %t163 = call i64 @"vfill"(i64 %t161, i64 %t162)
  store i64 %t163, ptr %local.new_state.115
  %t164 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.12)
  store i64 %t164, ptr %local.omega_sq.116
  %t165 = load i64, ptr %local.n_modes
  store i64 %t165, ptr %local.i.117
  br label %loop7
loop7:
  %t166 = load i64, ptr %local.i.117
  %t167 = load i64, ptr %local.n2.113
  %t168 = icmp slt i64 %t166, %t167
  %t169 = zext i1 %t168 to i64
  %t170 = icmp ne i64 %t169, 0
  br i1 %t170, label %body7, label %endloop7
body7:
  %t171 = load i64, ptr %local.state
  %t172 = load i64, ptr %local.i.117
  %t173 = call i64 @"vget"(i64 %t171, i64 %t172)
  store i64 %t173, ptr %local.w.118
  %t174 = load i64, ptr %local.omega_sq.116
  %t175 = load i64, ptr %local.w.118
  %t176 = load i64, ptr %local.w.118
  %t177 = call i64 @"sx_f64_mul"(i64 %t175, i64 %t176)
  %t178 = call i64 @"sx_f64_add"(i64 %t174, i64 %t177)
  store i64 %t178, ptr %local.omega_sq.116
  %t179 = load i64, ptr %local.i.117
  %t180 = add i64 %t179, 1
  store i64 %t180, ptr %local.i.117
  br label %loop7
endloop7:
  store i64 1, ptr %local.k.119
  br label %loop8
loop8:
  %t181 = load i64, ptr %local.k.119
  %t182 = load i64, ptr %local.k_max.114
  %t183 = icmp sle i64 %t181, %t182
  %t184 = zext i1 %t183 to i64
  %t185 = icmp ne i64 %t184, 0
  br i1 %t185, label %body8, label %endloop8
body8:
  %t186 = load i64, ptr %local.k.119
  %t187 = call i64 @"sx_int_to_f64"(i64 %t186)
  store i64 %t187, ptr %local.k_f.120
  %t188 = load i64, ptr %local.k_f.120
  %t189 = load i64, ptr %local.k_f.120
  %t190 = call i64 @"sx_f64_mul"(i64 %t188, i64 %t189)
  store i64 %t190, ptr %local.k_sq.121
  %t191 = load i64, ptr %local.k.119
  %t192 = sub i64 %t191, 1
  %t193 = mul i64 2, %t192
  store i64 %t193, ptr %local.ui0.122
  %t194 = load i64, ptr %local.k.119
  %t195 = sub i64 %t194, 1
  %t196 = mul i64 2, %t195
  %t197 = add i64 %t196, 1
  store i64 %t197, ptr %local.ui1.123
  %t198 = load i64, ptr %local.n_modes
  %t199 = load i64, ptr %local.k.119
  %t200 = sub i64 %t199, 1
  %t201 = mul i64 2, %t200
  %t202 = add i64 %t198, %t201
  store i64 %t202, ptr %local.wi0.124
  %t203 = load i64, ptr %local.n_modes
  %t204 = load i64, ptr %local.k.119
  %t205 = sub i64 %t204, 1
  %t206 = mul i64 2, %t205
  %t207 = add i64 %t203, %t206
  %t208 = add i64 %t207, 1
  store i64 %t208, ptr %local.wi1.125
  %t209 = load i64, ptr %local.state
  %t210 = load i64, ptr %local.ui0.122
  %t211 = call i64 @"vget"(i64 %t209, i64 %t210)
  store i64 %t211, ptr %local.u0.126
  %t212 = load i64, ptr %local.state
  %t213 = load i64, ptr %local.ui1.123
  %t214 = call i64 @"vget"(i64 %t212, i64 %t213)
  store i64 %t214, ptr %local.u1.127
  %t215 = load i64, ptr %local.state
  %t216 = load i64, ptr %local.wi0.124
  %t217 = call i64 @"vget"(i64 %t215, i64 %t216)
  store i64 %t217, ptr %local.w0.128
  %t218 = load i64, ptr %local.state
  %t219 = load i64, ptr %local.wi1.125
  %t220 = call i64 @"vget"(i64 %t218, i64 %t219)
  store i64 %t220, ptr %local.w1.129
  %t221 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.13)
  %t222 = load i64, ptr %local.nu
  %t223 = load i64, ptr %local.k_sq.121
  %t224 = call i64 @"sx_f64_mul"(i64 %t222, i64 %t223)
  %t225 = load i64, ptr %local.u0.126
  %t226 = call i64 @"sx_f64_mul"(i64 %t224, i64 %t225)
  %t227 = call i64 @"sx_f64_sub"(i64 %t221, i64 %t226)
  store i64 %t227, ptr %local.diff_u0.130
  %t228 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.14)
  %t229 = load i64, ptr %local.nu
  %t230 = load i64, ptr %local.k_sq.121
  %t231 = call i64 @"sx_f64_mul"(i64 %t229, i64 %t230)
  %t232 = load i64, ptr %local.u1.127
  %t233 = call i64 @"sx_f64_mul"(i64 %t231, i64 %t232)
  %t234 = call i64 @"sx_f64_sub"(i64 %t228, i64 %t233)
  store i64 %t234, ptr %local.diff_u1.131
  %t235 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.15)
  %t236 = load i64, ptr %local.nu
  %t237 = load i64, ptr %local.k_sq.121
  %t238 = call i64 @"sx_f64_mul"(i64 %t236, i64 %t237)
  %t239 = load i64, ptr %local.w0.128
  %t240 = call i64 @"sx_f64_mul"(i64 %t238, i64 %t239)
  %t241 = call i64 @"sx_f64_sub"(i64 %t235, i64 %t240)
  store i64 %t241, ptr %local.diff_w0.132
  %t242 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.16)
  %t243 = load i64, ptr %local.nu
  %t244 = load i64, ptr %local.k_sq.121
  %t245 = call i64 @"sx_f64_mul"(i64 %t243, i64 %t244)
  %t246 = load i64, ptr %local.w1.129
  %t247 = call i64 @"sx_f64_mul"(i64 %t245, i64 %t246)
  %t248 = call i64 @"sx_f64_sub"(i64 %t242, i64 %t247)
  store i64 %t248, ptr %local.diff_w1.133
  %t249 = load i64, ptr %local.sigma
  %t250 = load i64, ptr %local.w1.129
  %t251 = load i64, ptr %local.u1.127
  %t252 = call i64 @"sx_f64_mul"(i64 %t250, i64 %t251)
  %t253 = load i64, ptr %local.w0.128
  %t254 = load i64, ptr %local.u0.126
  %t255 = call i64 @"sx_f64_mul"(i64 %t253, i64 %t254)
  %t256 = call i64 @"sx_f64_sub"(i64 %t252, i64 %t255)
  %t257 = call i64 @"sx_f64_mul"(i64 %t249, i64 %t256)
  store i64 %t257, ptr %local.coup_u0.134
  %t258 = load i64, ptr %local.sigma
  %t259 = load i64, ptr %local.w0.128
  %t260 = load i64, ptr %local.u0.126
  %t261 = call i64 @"sx_f64_mul"(i64 %t259, i64 %t260)
  %t262 = load i64, ptr %local.w1.129
  %t263 = load i64, ptr %local.u1.127
  %t264 = call i64 @"sx_f64_mul"(i64 %t262, i64 %t263)
  %t265 = call i64 @"sx_f64_sub"(i64 %t261, i64 %t264)
  %t266 = call i64 @"sx_f64_mul"(i64 %t258, i64 %t265)
  store i64 %t266, ptr %local.coup_u1.135
  %t267 = load i64, ptr %local.lambda
  %t268 = load i64, ptr %local.w1.129
  %t269 = load i64, ptr %local.u0.126
  %t270 = call i64 @"sx_f64_mul"(i64 %t268, i64 %t269)
  %t271 = load i64, ptr %local.w0.128
  %t272 = load i64, ptr %local.u1.127
  %t273 = call i64 @"sx_f64_mul"(i64 %t271, i64 %t272)
  %t274 = call i64 @"sx_f64_add"(i64 %t270, i64 %t273)
  %t275 = call i64 @"sx_f64_mul"(i64 %t267, i64 %t274)
  store i64 %t275, ptr %local.stretch_w0.136
  %t276 = load i64, ptr %local.lambda
  %t277 = load i64, ptr %local.w0.128
  %t278 = load i64, ptr %local.u1.127
  %t279 = call i64 @"sx_f64_mul"(i64 %t277, i64 %t278)
  %t280 = load i64, ptr %local.w1.129
  %t281 = load i64, ptr %local.u0.126
  %t282 = call i64 @"sx_f64_mul"(i64 %t280, i64 %t281)
  %t283 = call i64 @"sx_f64_add"(i64 %t279, i64 %t282)
  %t284 = call i64 @"sx_f64_mul"(i64 %t276, i64 %t283)
  store i64 %t284, ptr %local.stretch_w1.137
  %t285 = load i64, ptr %local.lambda2
  %t286 = load i64, ptr %local.omega_sq.116
  %t287 = call i64 @"sx_f64_mul"(i64 %t285, i64 %t286)
  %t288 = load i64, ptr %local.w0.128
  %t289 = call i64 @"sx_f64_mul"(i64 %t287, i64 %t288)
  store i64 %t289, ptr %local.quad_w0.138
  %t290 = load i64, ptr %local.lambda2
  %t291 = load i64, ptr %local.omega_sq.116
  %t292 = call i64 @"sx_f64_mul"(i64 %t290, i64 %t291)
  %t293 = load i64, ptr %local.w1.129
  %t294 = call i64 @"sx_f64_mul"(i64 %t292, i64 %t293)
  store i64 %t294, ptr %local.quad_w1.139
  %t295 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.17)
  store i64 %t295, ptr %local.cascade_w0.140
  %t296 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.18)
  store i64 %t296, ptr %local.cascade_w1.141
  store i64 1, ptr %local.src_k.142
  br label %loop9
loop9:
  %t297 = load i64, ptr %local.src_k.142
  %t298 = load i64, ptr %local.k.119
  %t299 = icmp slt i64 %t297, %t298
  %t300 = zext i1 %t299 to i64
  %t301 = icmp ne i64 %t300, 0
  br i1 %t301, label %body9, label %endloop9
body9:
  %t302 = load i64, ptr %local.k.119
  %t303 = load i64, ptr %local.src_k.142
  %t304 = sub i64 %t302, %t303
  store i64 %t304, ptr %local.dist.143
  %t305 = load i64, ptr %local.n_modes
  %t306 = load i64, ptr %local.src_k.142
  %t307 = sub i64 %t306, 1
  %t308 = mul i64 2, %t307
  %t309 = add i64 %t305, %t308
  store i64 %t309, ptr %local.src_wi0.144
  %t310 = load i64, ptr %local.n_modes
  %t311 = load i64, ptr %local.src_k.142
  %t312 = sub i64 %t311, 1
  %t313 = mul i64 2, %t312
  %t314 = add i64 %t310, %t313
  %t315 = add i64 %t314, 1
  store i64 %t315, ptr %local.src_wi1.145
  %t316 = load i64, ptr %local.state
  %t317 = load i64, ptr %local.src_wi0.144
  %t318 = call i64 @"vget"(i64 %t316, i64 %t317)
  store i64 %t318, ptr %local.sw0.146
  %t319 = load i64, ptr %local.state
  %t320 = load i64, ptr %local.src_wi1.145
  %t321 = call i64 @"vget"(i64 %t319, i64 %t320)
  store i64 %t321, ptr %local.sw1.147
  %t322 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.19)
  store i64 %t322, ptr %local.scale.148
  %t323 = load i64, ptr %local.dist.143
  %t324 = icmp eq i64 %t323, 1
  %t325 = zext i1 %t324 to i64
  %t326 = icmp ne i64 %t325, 0
  br i1 %t326, label %then10, label %else10
then10:
  %t327 = load i64, ptr %local.src_k.142
  %t328 = sub i64 %t327, 1
  %t329 = call i64 @"decay_adj"(i64 %t328)
  store i64 %t329, ptr %local.scale.148
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t330 = load i64, ptr %local.dist.143
  %t331 = sub i64 %t330, 2
  %t332 = call i64 @"decay_skip"(i64 %t331)
  store i64 %t332, ptr %local.scale.148
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t333 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t334 = load i64, ptr %local.cascade_w0.140
  %t335 = load i64, ptr %local.scale.148
  %t336 = load i64, ptr %local.sw0.146
  %t337 = call i64 @"sx_f64_mul"(i64 %t335, i64 %t336)
  %t338 = load i64, ptr %local.sw1.147
  %t339 = call i64 @"sx_f64_mul"(i64 %t337, i64 %t338)
  %t340 = call i64 @"sx_f64_add"(i64 %t334, i64 %t339)
  store i64 %t340, ptr %local.cascade_w0.140
  %t341 = load i64, ptr %local.cascade_w1.141
  %t342 = load i64, ptr %local.scale.148
  %t343 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.20)
  %t344 = load i64, ptr %local.sw0.146
  %t345 = load i64, ptr %local.sw1.147
  %t346 = call i64 @"sx_f64_mul"(i64 %t344, i64 %t345)
  %t347 = call i64 @"sx_f64_sub"(i64 %t343, i64 %t346)
  %t348 = call i64 @"sx_f64_mul"(i64 %t342, i64 %t347)
  %t349 = call i64 @"sx_f64_add"(i64 %t341, i64 %t348)
  store i64 %t349, ptr %local.cascade_w1.141
  %t350 = load i64, ptr %local.src_k.142
  %t351 = add i64 %t350, 1
  store i64 %t351, ptr %local.src_k.142
  br label %loop9
endloop9:
  %t352 = load i64, ptr %local.u0.126
  %t353 = load i64, ptr %local.dt
  %t354 = load i64, ptr %local.diff_u0.130
  %t355 = load i64, ptr %local.coup_u0.134
  %t356 = call i64 @"sx_f64_add"(i64 %t354, i64 %t355)
  %t357 = call i64 @"sx_f64_mul"(i64 %t353, i64 %t356)
  %t358 = call i64 @"sx_f64_add"(i64 %t352, i64 %t357)
  store i64 %t358, ptr %local.new_u0.149
  %t359 = load i64, ptr %local.u1.127
  %t360 = load i64, ptr %local.dt
  %t361 = load i64, ptr %local.diff_u1.131
  %t362 = load i64, ptr %local.coup_u1.135
  %t363 = call i64 @"sx_f64_add"(i64 %t361, i64 %t362)
  %t364 = call i64 @"sx_f64_mul"(i64 %t360, i64 %t363)
  %t365 = call i64 @"sx_f64_add"(i64 %t359, i64 %t364)
  store i64 %t365, ptr %local.new_u1.150
  %t366 = load i64, ptr %local.w0.128
  %t367 = load i64, ptr %local.dt
  %t368 = load i64, ptr %local.diff_w0.132
  %t369 = load i64, ptr %local.stretch_w0.136
  %t370 = call i64 @"sx_f64_add"(i64 %t368, i64 %t369)
  %t371 = load i64, ptr %local.quad_w0.138
  %t372 = call i64 @"sx_f64_add"(i64 %t370, i64 %t371)
  %t373 = load i64, ptr %local.cascade_w0.140
  %t374 = call i64 @"sx_f64_add"(i64 %t372, i64 %t373)
  %t375 = call i64 @"sx_f64_mul"(i64 %t367, i64 %t374)
  %t376 = call i64 @"sx_f64_add"(i64 %t366, i64 %t375)
  store i64 %t376, ptr %local.new_w0.151
  %t377 = load i64, ptr %local.w1.129
  %t378 = load i64, ptr %local.dt
  %t379 = load i64, ptr %local.diff_w1.133
  %t380 = load i64, ptr %local.stretch_w1.137
  %t381 = call i64 @"sx_f64_add"(i64 %t379, i64 %t380)
  %t382 = load i64, ptr %local.quad_w1.139
  %t383 = call i64 @"sx_f64_add"(i64 %t381, i64 %t382)
  %t384 = load i64, ptr %local.cascade_w1.141
  %t385 = call i64 @"sx_f64_add"(i64 %t383, i64 %t384)
  %t386 = call i64 @"sx_f64_mul"(i64 %t378, i64 %t385)
  %t387 = call i64 @"sx_f64_add"(i64 %t377, i64 %t386)
  store i64 %t387, ptr %local.new_w1.152
  %t388 = load i64, ptr %local.new_state.115
  %t389 = load i64, ptr %local.ui0.122
  %t390 = load i64, ptr %local.new_u0.149
  %t391 = call i64 @"vset"(i64 %t388, i64 %t389, i64 %t390)
  store i64 %t391, ptr %local._a.153
  %t392 = load i64, ptr %local.new_state.115
  %t393 = load i64, ptr %local.ui1.123
  %t394 = load i64, ptr %local.new_u1.150
  %t395 = call i64 @"vset"(i64 %t392, i64 %t393, i64 %t394)
  store i64 %t395, ptr %local._b.154
  %t396 = load i64, ptr %local.new_state.115
  %t397 = load i64, ptr %local.wi0.124
  %t398 = load i64, ptr %local.new_w0.151
  %t399 = call i64 @"vset"(i64 %t396, i64 %t397, i64 %t398)
  store i64 %t399, ptr %local._c.155
  %t400 = load i64, ptr %local.new_state.115
  %t401 = load i64, ptr %local.wi1.125
  %t402 = load i64, ptr %local.new_w1.152
  %t403 = call i64 @"vset"(i64 %t400, i64 %t401, i64 %t402)
  store i64 %t403, ptr %local._d.156
  %t404 = load i64, ptr %local.k.119
  %t405 = add i64 %t404, 1
  store i64 %t405, ptr %local.k.119
  br label %loop8
endloop8:
  %t406 = load i64, ptr %local.new_state.115
  ret i64 %t406
}

define i64 @"init_state"(i64 %n_modes, i64 %amp) nounwind {
entry:
  %local.n2.407 = alloca i64
  %local.state.408 = alloca i64
  %local.pi.409 = alloca i64
  %local.k_max.410 = alloca i64
  %local.k.411 = alloca i64
  %local.k_f.412 = alloca i64
  %local.vel_amp.413 = alloca i64
  %local.ui0.414 = alloca i64
  %local.ui1.415 = alloca i64
  %local._a.416 = alloca i64
  %local._b.417 = alloca i64
  %local.vort_amp.418 = alloca i64
  %local.wi0.419 = alloca i64
  %local.wi1.420 = alloca i64
  %local._c.421 = alloca i64
  %local._d.422 = alloca i64
  %local.n_modes = alloca i64
  store i64 %n_modes, ptr %local.n_modes
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %t423 = load i64, ptr %local.n_modes
  %t424 = mul i64 2, %t423
  store i64 %t424, ptr %local.n2.407
  %t425 = load i64, ptr %local.n2.407
  %t426 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.21)
  %t427 = call i64 @"vfill"(i64 %t425, i64 %t426)
  store i64 %t427, ptr %local.state.408
  %t428 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.22)
  store i64 %t428, ptr %local.pi.409
  %t429 = load i64, ptr %local.n_modes
  %t430 = sdiv i64 %t429, 2
  store i64 %t430, ptr %local.k_max.410
  store i64 1, ptr %local.k.411
  br label %loop11
loop11:
  %t431 = load i64, ptr %local.k.411
  %t432 = load i64, ptr %local.k_max.410
  %t433 = icmp sle i64 %t431, %t432
  %t434 = zext i1 %t433 to i64
  %t435 = icmp ne i64 %t434, 0
  br i1 %t435, label %body11, label %endloop11
body11:
  %t436 = load i64, ptr %local.k.411
  %t437 = call i64 @"sx_int_to_f64"(i64 %t436)
  store i64 %t437, ptr %local.k_f.412
  %t438 = load i64, ptr %local.amp
  %t439 = load i64, ptr %local.k_f.412
  %t440 = call i64 @"sx_f64_div"(i64 %t438, i64 %t439)
  store i64 %t440, ptr %local.vel_amp.413
  %t441 = load i64, ptr %local.k.411
  %t442 = sub i64 %t441, 1
  %t443 = mul i64 2, %t442
  store i64 %t443, ptr %local.ui0.414
  %t444 = load i64, ptr %local.k.411
  %t445 = sub i64 %t444, 1
  %t446 = mul i64 2, %t445
  %t447 = add i64 %t446, 1
  store i64 %t447, ptr %local.ui1.415
  %t448 = load i64, ptr %local.state.408
  %t449 = load i64, ptr %local.ui0.414
  %t450 = load i64, ptr %local.vel_amp.413
  %t451 = load i64, ptr %local.pi.409
  %t452 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.23)
  %t453 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.24)
  %t454 = load i64, ptr %local.k_f.412
  %t455 = call i64 @"sx_f64_mul"(i64 %t453, i64 %t454)
  %t456 = call i64 @"sx_f64_add"(i64 %t452, i64 %t455)
  %t457 = call i64 @"sx_f64_mul"(i64 %t451, i64 %t456)
  %t458 = call i64 @"sin_f64"(i64 %t457)
  %t459 = call i64 @"sx_f64_mul"(i64 %t450, i64 %t458)
  %t460 = call i64 @"vset"(i64 %t448, i64 %t449, i64 %t459)
  store i64 %t460, ptr %local._a.416
  %t461 = load i64, ptr %local.state.408
  %t462 = load i64, ptr %local.ui1.415
  %t463 = load i64, ptr %local.vel_amp.413
  %t464 = load i64, ptr %local.pi.409
  %t465 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.25)
  %t466 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.26)
  %t467 = load i64, ptr %local.k_f.412
  %t468 = call i64 @"sx_f64_mul"(i64 %t466, i64 %t467)
  %t469 = call i64 @"sx_f64_add"(i64 %t465, i64 %t468)
  %t470 = call i64 @"sx_f64_mul"(i64 %t464, i64 %t469)
  %t471 = call i64 @"sin_f64"(i64 %t470)
  %t472 = call i64 @"sx_f64_mul"(i64 %t463, i64 %t471)
  %t473 = call i64 @"vset"(i64 %t461, i64 %t462, i64 %t472)
  store i64 %t473, ptr %local._b.417
  %t474 = load i64, ptr %local.amp
  %t475 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.27)
  %t476 = call i64 @"sx_f64_mul"(i64 %t474, i64 %t475)
  %t477 = load i64, ptr %local.k_f.412
  %t478 = call i64 @"sx_f64_div"(i64 %t476, i64 %t477)
  store i64 %t478, ptr %local.vort_amp.418
  %t479 = load i64, ptr %local.n_modes
  %t480 = load i64, ptr %local.k.411
  %t481 = sub i64 %t480, 1
  %t482 = mul i64 2, %t481
  %t483 = add i64 %t479, %t482
  store i64 %t483, ptr %local.wi0.419
  %t484 = load i64, ptr %local.n_modes
  %t485 = load i64, ptr %local.k.411
  %t486 = sub i64 %t485, 1
  %t487 = mul i64 2, %t486
  %t488 = add i64 %t484, %t487
  %t489 = add i64 %t488, 1
  store i64 %t489, ptr %local.wi1.420
  %t490 = load i64, ptr %local.state.408
  %t491 = load i64, ptr %local.wi0.419
  %t492 = load i64, ptr %local.vort_amp.418
  %t493 = load i64, ptr %local.pi.409
  %t494 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.28)
  %t495 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.29)
  %t496 = load i64, ptr %local.k_f.412
  %t497 = call i64 @"sx_f64_mul"(i64 %t495, i64 %t496)
  %t498 = call i64 @"sx_f64_add"(i64 %t494, i64 %t497)
  %t499 = call i64 @"sx_f64_mul"(i64 %t493, i64 %t498)
  %t500 = call i64 @"sin_f64"(i64 %t499)
  %t501 = call i64 @"sx_f64_mul"(i64 %t492, i64 %t500)
  %t502 = call i64 @"vset"(i64 %t490, i64 %t491, i64 %t501)
  store i64 %t502, ptr %local._c.421
  %t503 = load i64, ptr %local.state.408
  %t504 = load i64, ptr %local.wi1.420
  %t505 = load i64, ptr %local.vort_amp.418
  %t506 = load i64, ptr %local.pi.409
  %t507 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.30)
  %t508 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.31)
  %t509 = load i64, ptr %local.k_f.412
  %t510 = call i64 @"sx_f64_mul"(i64 %t508, i64 %t509)
  %t511 = call i64 @"sx_f64_add"(i64 %t507, i64 %t510)
  %t512 = call i64 @"sx_f64_mul"(i64 %t506, i64 %t511)
  %t513 = call i64 @"sin_f64"(i64 %t512)
  %t514 = call i64 @"sx_f64_mul"(i64 %t505, i64 %t513)
  %t515 = call i64 @"vset"(i64 %t503, i64 %t504, i64 %t514)
  store i64 %t515, ptr %local._d.422
  %t516 = load i64, ptr %local.k.411
  %t517 = add i64 %t516, 1
  store i64 %t517, ptr %local.k.411
  br label %loop11
endloop11:
  %t518 = load i64, ptr %local.state.408
  ret i64 %t518
}

define i64 @"run_max_enstrophy"(i64 %n_modes, i64 %amp, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps) nounwind {
entry:
  %local.state.519 = alloca i64
  %local.s.520 = alloca i64
  %local.max_e.521 = alloca i64
  %local.e.522 = alloca i64
  %local.n_modes = alloca i64
  store i64 %n_modes, ptr %local.n_modes
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %t523 = load i64, ptr %local.n_modes
  %t524 = load i64, ptr %local.amp
  %t525 = call i64 @"init_state"(i64 %t523, i64 %t524)
  store i64 %t525, ptr %local.state.519
  store i64 0, ptr %local.s.520
  %t526 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.32)
  store i64 %t526, ptr %local.max_e.521
  br label %loop12
loop12:
  %t527 = load i64, ptr %local.s.520
  %t528 = load i64, ptr %local.max_steps
  %t529 = icmp slt i64 %t527, %t528
  %t530 = zext i1 %t529 to i64
  %t531 = icmp ne i64 %t530, 0
  br i1 %t531, label %body12, label %endloop12
body12:
  %t532 = load i64, ptr %local.state.519
  %t533 = load i64, ptr %local.n_modes
  %t534 = call i64 @"total_enstrophy"(i64 %t532, i64 %t533)
  store i64 %t534, ptr %local.e.522
  %t535 = load i64, ptr %local.e.522
  %t536 = load i64, ptr %local.max_e.521
  %t537 = call i64 @"sx_f64_gt"(i64 %t535, i64 %t536)
  %t538 = icmp ne i64 %t537, 0
  br i1 %t538, label %then13, label %else13
then13:
  %t539 = load i64, ptr %local.e.522
  store i64 %t539, ptr %local.max_e.521
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t540 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t541 = load i64, ptr %local.e.522
  %t542 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.33)
  %t543 = call i64 @"sx_f64_gt"(i64 %t541, i64 %t542)
  %t544 = icmp ne i64 %t543, 0
  br i1 %t544, label %then14, label %else14
then14:
  %t545 = load i64, ptr %local.max_e.521
  ret i64 %t545
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t546 = phi i64 [ 0, %else14_end ]
  %t547 = load i64, ptr %local.state.519
  %t548 = load i64, ptr %local.n_modes
  %t549 = load i64, ptr %local.nu
  %t550 = load i64, ptr %local.sigma
  %t551 = load i64, ptr %local.lambda
  %t552 = load i64, ptr %local.lambda2
  %t553 = load i64, ptr %local.dt
  %t554 = call i64 @"step_n"(i64 %t547, i64 %t548, i64 %t549, i64 %t550, i64 %t551, i64 %t552, i64 %t553)
  store i64 %t554, ptr %local.state.519
  %t555 = load i64, ptr %local.s.520
  %t556 = add i64 %t555, 1
  store i64 %t556, ptr %local.s.520
  br label %loop12
endloop12:
  %t557 = load i64, ptr %local.max_e.521
  ret i64 %t557
}

define i64 @"find_astar"(i64 %n_modes, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps) nounwind {
entry:
  %local.lo.558 = alloca i64
  %local.hi.559 = alloca i64
  %local.iter.560 = alloca i64
  %local.mid.561 = alloca i64
  %local.max_e.562 = alloca i64
  %local.n_modes = alloca i64
  store i64 %n_modes, ptr %local.n_modes
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %t563 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.34)
  store i64 %t563, ptr %local.lo.558
  %t564 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.35)
  store i64 %t564, ptr %local.hi.559
  store i64 0, ptr %local.iter.560
  br label %loop15
loop15:
  %t565 = load i64, ptr %local.iter.560
  %t566 = icmp slt i64 %t565, 16
  %t567 = zext i1 %t566 to i64
  %t568 = icmp ne i64 %t567, 0
  br i1 %t568, label %body15, label %endloop15
body15:
  %t569 = load i64, ptr %local.lo.558
  %t570 = load i64, ptr %local.hi.559
  %t571 = call i64 @"sx_f64_add"(i64 %t569, i64 %t570)
  %t572 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.36)
  %t573 = call i64 @"sx_f64_div"(i64 %t571, i64 %t572)
  store i64 %t573, ptr %local.mid.561
  %t574 = load i64, ptr %local.n_modes
  %t575 = load i64, ptr %local.mid.561
  %t576 = load i64, ptr %local.nu
  %t577 = load i64, ptr %local.sigma
  %t578 = load i64, ptr %local.lambda
  %t579 = load i64, ptr %local.lambda2
  %t580 = load i64, ptr %local.dt
  %t581 = load i64, ptr %local.max_steps
  %t582 = call i64 @"run_max_enstrophy"(i64 %t574, i64 %t575, i64 %t576, i64 %t577, i64 %t578, i64 %t579, i64 %t580, i64 %t581)
  store i64 %t582, ptr %local.max_e.562
  %t583 = load i64, ptr %local.max_e.562
  %t584 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.37)
  %t585 = call i64 @"sx_f64_gt"(i64 %t583, i64 %t584)
  %t586 = icmp ne i64 %t585, 0
  br i1 %t586, label %then16, label %else16
then16:
  %t587 = load i64, ptr %local.mid.561
  store i64 %t587, ptr %local.hi.559
  br label %then16_end
then16_end:
  br label %endif16
else16:
  %t588 = load i64, ptr %local.mid.561
  store i64 %t588, ptr %local.lo.558
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t589 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t590 = load i64, ptr %local.iter.560
  %t591 = add i64 %t590, 1
  store i64 %t591, ptr %local.iter.560
  br label %loop15
endloop15:
  %t592 = load i64, ptr %local.lo.558
  %t593 = load i64, ptr %local.hi.559
  %t594 = call i64 @"sx_f64_add"(i64 %t592, i64 %t593)
  %t595 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.38)
  %t596 = call i64 @"sx_f64_div"(i64 %t594, i64 %t595)
  ret i64 %t596
}

define i64 @"bootstrap_ratio"(i64 %n_modes, i64 %omega_max, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps) nounwind {
entry:
  %local.amp.597 = alloca i64
  %local.max_e.598 = alloca i64
  %local.n_modes = alloca i64
  store i64 %n_modes, ptr %local.n_modes
  %local.omega_max = alloca i64
  store i64 %omega_max, ptr %local.omega_max
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %t599 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.39)
  %t600 = load i64, ptr %local.omega_max
  %t601 = call i64 @"sx_f64_mul"(i64 %t599, i64 %t600)
  %t602 = call i64 @"my_sqrt"(i64 %t601)
  store i64 %t602, ptr %local.amp.597
  %t603 = load i64, ptr %local.n_modes
  %t604 = load i64, ptr %local.amp.597
  %t605 = load i64, ptr %local.nu
  %t606 = load i64, ptr %local.sigma
  %t607 = load i64, ptr %local.lambda
  %t608 = load i64, ptr %local.lambda2
  %t609 = load i64, ptr %local.dt
  %t610 = load i64, ptr %local.max_steps
  %t611 = call i64 @"run_max_enstrophy"(i64 %t603, i64 %t604, i64 %t605, i64 %t606, i64 %t607, i64 %t608, i64 %t609, i64 %t610)
  store i64 %t611, ptr %local.max_e.598
  %t612 = load i64, ptr %local.omega_max
  %t613 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.40)
  %t614 = call i64 @"sx_f64_gt"(i64 %t612, i64 %t613)
  %t615 = icmp ne i64 %t614, 0
  br i1 %t615, label %then17, label %else17
then17:
  %t616 = load i64, ptr %local.max_e.598
  %t617 = load i64, ptr %local.omega_max
  %t618 = call i64 @"sx_f64_div"(i64 %t616, i64 %t617)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  %t619 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.41)
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t620 = phi i64 [ %t618, %then17_end ], [ %t619, %else17_end ]
  ret i64 %t620
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.nu.621 = alloca i64
  %local.sigma.622 = alloca i64
  %local.lambda.623 = alloca i64
  %local.lambda2.624 = alloca i64
  %local.dt.625 = alloca i64
  %local.max_steps.626 = alloca i64
  %local.n6.627 = alloca i64
  %local.astar_6.628 = alloca i64
  %local.diff_6.629 = alloca i64
  %local.n8.630 = alloca i64
  %local.astar_8.631 = alloca i64
  %local.diff_8.632 = alloca i64
  %local.n12.633 = alloca i64
  %local.astar_12.634 = alloca i64
  %local.diff_12.635 = alloca i64
  %local.n16.636 = alloca i64
  %local.astar_16.637 = alloca i64
  %local.diff_16.638 = alloca i64
  %local.prev_astar.639 = alloca i64
  %local.n24.640 = alloca i64
  %local.astar_24.641 = alloca i64
  %local.n32.642 = alloca i64
  %local.astar_32.643 = alloca i64
  %local.n48.644 = alloca i64
  %local.astar_48.645 = alloca i64
  %local.n64.646 = alloca i64
  %local.astar_64.647 = alloca i64
  %local.n96.648 = alloca i64
  %local.astar_96.649 = alloca i64
  %local.n128.650 = alloca i64
  %local.astar_128.651 = alloca i64
  %local.violations.652 = alloca i64
  %local.transitions.653 = alloca i64
  %local.inv64.654 = alloca i64
  %local.inv128.655 = alloca i64
  %local.c_fit.656 = alloca i64
  %local.a_inf.657 = alloca i64
  %local.pred_6.658 = alloca i64
  %local.pred_16.659 = alloca i64
  %local.pred_48.660 = alloca i64
  %local.pred_128.661 = alloca i64
  %t662 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.42)
  store i64 %t662, ptr %local.nu.621
  %t663 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.43)
  store i64 %t663, ptr %local.sigma.622
  %t664 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.44)
  store i64 %t664, ptr %local.lambda.623
  %t665 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.45)
  store i64 %t665, ptr %local.lambda2.624
  %t666 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.46)
  store i64 %t666, ptr %local.dt.625
  store i64 50000, ptr %local.max_steps.626
  %t667 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.47)
  %t668 = ptrtoint ptr %t667 to i64
  %t669 = inttoptr i64 %t668 to ptr
  call void @intrinsic_println(ptr %t669)
  %t670 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.48)
  %t671 = ptrtoint ptr %t670 to i64
  %t672 = inttoptr i64 %t671 to ptr
  call void @intrinsic_println(ptr %t672)
  %t673 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.49)
  %t674 = ptrtoint ptr %t673 to i64
  %t675 = inttoptr i64 %t674 to ptr
  call void @intrinsic_println(ptr %t675)
  %t676 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.50)
  %t677 = ptrtoint ptr %t676 to i64
  %t678 = inttoptr i64 %t677 to ptr
  call void @intrinsic_println(ptr %t678)
  %t679 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.51)
  %t680 = ptrtoint ptr %t679 to i64
  %t681 = inttoptr i64 %t680 to ptr
  call void @intrinsic_println(ptr %t681)
  %t682 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.52)
  %t683 = ptrtoint ptr %t682 to i64
  %t684 = inttoptr i64 %t683 to ptr
  call void @intrinsic_println(ptr %t684)
  %t685 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.53)
  %t686 = ptrtoint ptr %t685 to i64
  %t687 = inttoptr i64 %t686 to ptr
  call void @intrinsic_println(ptr %t687)
  %t688 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.54)
  %t689 = ptrtoint ptr %t688 to i64
  %t690 = inttoptr i64 %t689 to ptr
  call void @intrinsic_println(ptr %t690)
  %t691 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.55)
  %t692 = ptrtoint ptr %t691 to i64
  %t693 = inttoptr i64 %t692 to ptr
  call void @intrinsic_println(ptr %t693)
  %t694 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.56)
  %t695 = ptrtoint ptr %t694 to i64
  %t696 = inttoptr i64 %t695 to ptr
  call void @intrinsic_println(ptr %t696)
  %t697 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.57)
  %t698 = ptrtoint ptr %t697 to i64
  %t699 = inttoptr i64 %t698 to ptr
  call void @intrinsic_println(ptr %t699)
  %t700 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.58)
  %t701 = ptrtoint ptr %t700 to i64
  %t702 = inttoptr i64 %t701 to ptr
  call void @intrinsic_println(ptr %t702)
  %t703 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.59)
  %t704 = ptrtoint ptr %t703 to i64
  %t705 = inttoptr i64 %t704 to ptr
  call void @intrinsic_println(ptr %t705)
  %t706 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.60)
  %t707 = ptrtoint ptr %t706 to i64
  %t708 = inttoptr i64 %t707 to ptr
  call void @intrinsic_println(ptr %t708)
  %t709 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.61)
  %t710 = ptrtoint ptr %t709 to i64
  %t711 = inttoptr i64 %t710 to ptr
  call void @intrinsic_println(ptr %t711)
  %t712 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.62)
  %t713 = ptrtoint ptr %t712 to i64
  %t714 = inttoptr i64 %t713 to ptr
  call void @intrinsic_println(ptr %t714)
  store i64 6, ptr %local.n6.627
  %t715 = load i64, ptr %local.n6.627
  %t716 = load i64, ptr %local.nu.621
  %t717 = load i64, ptr %local.sigma.622
  %t718 = load i64, ptr %local.lambda.623
  %t719 = load i64, ptr %local.lambda2.624
  %t720 = load i64, ptr %local.dt.625
  %t721 = load i64, ptr %local.max_steps.626
  %t722 = call i64 @"find_astar"(i64 %t715, i64 %t716, i64 %t717, i64 %t718, i64 %t719, i64 %t720, i64 %t721)
  store i64 %t722, ptr %local.astar_6.628
  %t723 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.63)
  %t724 = ptrtoint ptr %t723 to i64
  %t725 = inttoptr i64 %t724 to ptr
  call void @intrinsic_print(ptr %t725)
  %t726 = load i64, ptr %local.astar_6.628
  %t727 = call i64 @"print_f64"(i64 %t726)
  %t728 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.64)
  %t729 = ptrtoint ptr %t728 to i64
  %t730 = inttoptr i64 %t729 to ptr
  call void @intrinsic_print(ptr %t730)
  %t731 = load i64, ptr %local.astar_6.628
  %t732 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.65)
  %t733 = call i64 @"sx_f64_sub"(i64 %t731, i64 %t732)
  %t734 = call i64 @"abs_f64"(i64 %t733)
  %t735 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.66)
  %t736 = call i64 @"sx_f64_div"(i64 %t734, i64 %t735)
  store i64 %t736, ptr %local.diff_6.629
  %t737 = load i64, ptr %local.diff_6.629
  %t738 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.67)
  %t739 = call i64 @"sx_f64_lt"(i64 %t737, i64 %t738)
  %t740 = icmp ne i64 %t739, 0
  br i1 %t740, label %then18, label %else18
then18:
  %t741 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.68)
  %t742 = ptrtoint ptr %t741 to i64
  %t743 = inttoptr i64 %t742 to ptr
  call void @intrinsic_println(ptr %t743)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  %t744 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.69)
  %t745 = ptrtoint ptr %t744 to i64
  %t746 = inttoptr i64 %t745 to ptr
  call void @intrinsic_println(ptr %t746)
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t747 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  store i64 8, ptr %local.n8.630
  %t748 = load i64, ptr %local.n8.630
  %t749 = load i64, ptr %local.nu.621
  %t750 = load i64, ptr %local.sigma.622
  %t751 = load i64, ptr %local.lambda.623
  %t752 = load i64, ptr %local.lambda2.624
  %t753 = load i64, ptr %local.dt.625
  %t754 = load i64, ptr %local.max_steps.626
  %t755 = call i64 @"find_astar"(i64 %t748, i64 %t749, i64 %t750, i64 %t751, i64 %t752, i64 %t753, i64 %t754)
  store i64 %t755, ptr %local.astar_8.631
  %t756 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.70)
  %t757 = ptrtoint ptr %t756 to i64
  %t758 = inttoptr i64 %t757 to ptr
  call void @intrinsic_print(ptr %t758)
  %t759 = load i64, ptr %local.astar_8.631
  %t760 = call i64 @"print_f64"(i64 %t759)
  %t761 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.71)
  %t762 = ptrtoint ptr %t761 to i64
  %t763 = inttoptr i64 %t762 to ptr
  call void @intrinsic_print(ptr %t763)
  %t764 = load i64, ptr %local.astar_8.631
  %t765 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.72)
  %t766 = call i64 @"sx_f64_sub"(i64 %t764, i64 %t765)
  %t767 = call i64 @"abs_f64"(i64 %t766)
  %t768 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.73)
  %t769 = call i64 @"sx_f64_div"(i64 %t767, i64 %t768)
  store i64 %t769, ptr %local.diff_8.632
  %t770 = load i64, ptr %local.diff_8.632
  %t771 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.74)
  %t772 = call i64 @"sx_f64_lt"(i64 %t770, i64 %t771)
  %t773 = icmp ne i64 %t772, 0
  br i1 %t773, label %then19, label %else19
then19:
  %t774 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.75)
  %t775 = ptrtoint ptr %t774 to i64
  %t776 = inttoptr i64 %t775 to ptr
  call void @intrinsic_println(ptr %t776)
  br label %then19_end
then19_end:
  br label %endif19
else19:
  %t777 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.76)
  %t778 = ptrtoint ptr %t777 to i64
  %t779 = inttoptr i64 %t778 to ptr
  call void @intrinsic_println(ptr %t779)
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t780 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  store i64 12, ptr %local.n12.633
  %t781 = load i64, ptr %local.n12.633
  %t782 = load i64, ptr %local.nu.621
  %t783 = load i64, ptr %local.sigma.622
  %t784 = load i64, ptr %local.lambda.623
  %t785 = load i64, ptr %local.lambda2.624
  %t786 = load i64, ptr %local.dt.625
  %t787 = load i64, ptr %local.max_steps.626
  %t788 = call i64 @"find_astar"(i64 %t781, i64 %t782, i64 %t783, i64 %t784, i64 %t785, i64 %t786, i64 %t787)
  store i64 %t788, ptr %local.astar_12.634
  %t789 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.77)
  %t790 = ptrtoint ptr %t789 to i64
  %t791 = inttoptr i64 %t790 to ptr
  call void @intrinsic_print(ptr %t791)
  %t792 = load i64, ptr %local.astar_12.634
  %t793 = call i64 @"print_f64"(i64 %t792)
  %t794 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.78)
  %t795 = ptrtoint ptr %t794 to i64
  %t796 = inttoptr i64 %t795 to ptr
  call void @intrinsic_print(ptr %t796)
  %t797 = load i64, ptr %local.astar_12.634
  %t798 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.79)
  %t799 = call i64 @"sx_f64_sub"(i64 %t797, i64 %t798)
  %t800 = call i64 @"abs_f64"(i64 %t799)
  %t801 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.80)
  %t802 = call i64 @"sx_f64_div"(i64 %t800, i64 %t801)
  store i64 %t802, ptr %local.diff_12.635
  %t803 = load i64, ptr %local.diff_12.635
  %t804 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.81)
  %t805 = call i64 @"sx_f64_lt"(i64 %t803, i64 %t804)
  %t806 = icmp ne i64 %t805, 0
  br i1 %t806, label %then20, label %else20
then20:
  %t807 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.82)
  %t808 = ptrtoint ptr %t807 to i64
  %t809 = inttoptr i64 %t808 to ptr
  call void @intrinsic_println(ptr %t809)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  %t810 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.83)
  %t811 = ptrtoint ptr %t810 to i64
  %t812 = inttoptr i64 %t811 to ptr
  call void @intrinsic_println(ptr %t812)
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t813 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  store i64 16, ptr %local.n16.636
  %t814 = load i64, ptr %local.n16.636
  %t815 = load i64, ptr %local.nu.621
  %t816 = load i64, ptr %local.sigma.622
  %t817 = load i64, ptr %local.lambda.623
  %t818 = load i64, ptr %local.lambda2.624
  %t819 = load i64, ptr %local.dt.625
  %t820 = load i64, ptr %local.max_steps.626
  %t821 = call i64 @"find_astar"(i64 %t814, i64 %t815, i64 %t816, i64 %t817, i64 %t818, i64 %t819, i64 %t820)
  store i64 %t821, ptr %local.astar_16.637
  %t822 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.84)
  %t823 = ptrtoint ptr %t822 to i64
  %t824 = inttoptr i64 %t823 to ptr
  call void @intrinsic_print(ptr %t824)
  %t825 = load i64, ptr %local.astar_16.637
  %t826 = call i64 @"print_f64"(i64 %t825)
  %t827 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.85)
  %t828 = ptrtoint ptr %t827 to i64
  %t829 = inttoptr i64 %t828 to ptr
  call void @intrinsic_print(ptr %t829)
  %t830 = load i64, ptr %local.astar_16.637
  %t831 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.86)
  %t832 = call i64 @"sx_f64_sub"(i64 %t830, i64 %t831)
  %t833 = call i64 @"abs_f64"(i64 %t832)
  %t834 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.87)
  %t835 = call i64 @"sx_f64_div"(i64 %t833, i64 %t834)
  store i64 %t835, ptr %local.diff_16.638
  %t836 = load i64, ptr %local.diff_16.638
  %t837 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.88)
  %t838 = call i64 @"sx_f64_lt"(i64 %t836, i64 %t837)
  %t839 = icmp ne i64 %t838, 0
  br i1 %t839, label %then21, label %else21
then21:
  %t840 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.89)
  %t841 = ptrtoint ptr %t840 to i64
  %t842 = inttoptr i64 %t841 to ptr
  call void @intrinsic_println(ptr %t842)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t843 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.90)
  %t844 = ptrtoint ptr %t843 to i64
  %t845 = inttoptr i64 %t844 to ptr
  call void @intrinsic_println(ptr %t845)
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t846 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t847 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.91)
  %t848 = ptrtoint ptr %t847 to i64
  %t849 = inttoptr i64 %t848 to ptr
  call void @intrinsic_println(ptr %t849)
  %t850 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.92)
  %t851 = ptrtoint ptr %t850 to i64
  %t852 = inttoptr i64 %t851 to ptr
  call void @intrinsic_println(ptr %t852)
  %t853 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.93)
  %t854 = ptrtoint ptr %t853 to i64
  %t855 = inttoptr i64 %t854 to ptr
  call void @intrinsic_println(ptr %t855)
  %t856 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.94)
  %t857 = ptrtoint ptr %t856 to i64
  %t858 = inttoptr i64 %t857 to ptr
  call void @intrinsic_println(ptr %t858)
  %t859 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.95)
  %t860 = ptrtoint ptr %t859 to i64
  %t861 = inttoptr i64 %t860 to ptr
  call void @intrinsic_println(ptr %t861)
  %t862 = load i64, ptr %local.astar_16.637
  store i64 %t862, ptr %local.prev_astar.639
  store i64 24, ptr %local.n24.640
  %t863 = load i64, ptr %local.n24.640
  %t864 = load i64, ptr %local.nu.621
  %t865 = load i64, ptr %local.sigma.622
  %t866 = load i64, ptr %local.lambda.623
  %t867 = load i64, ptr %local.lambda2.624
  %t868 = load i64, ptr %local.dt.625
  %t869 = load i64, ptr %local.max_steps.626
  %t870 = call i64 @"find_astar"(i64 %t863, i64 %t864, i64 %t865, i64 %t866, i64 %t867, i64 %t868, i64 %t869)
  store i64 %t870, ptr %local.astar_24.641
  %t871 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.96)
  %t872 = ptrtoint ptr %t871 to i64
  %t873 = inttoptr i64 %t872 to ptr
  call void @intrinsic_print(ptr %t873)
  %t874 = load i64, ptr %local.astar_24.641
  %t875 = call i64 @"print_f64"(i64 %t874)
  %t876 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.97)
  %t877 = ptrtoint ptr %t876 to i64
  %t878 = inttoptr i64 %t877 to ptr
  call void @intrinsic_print(ptr %t878)
  %t879 = load i64, ptr %local.astar_24.641
  %t880 = load i64, ptr %local.prev_astar.639
  %t881 = call i64 @"sx_f64_sub"(i64 %t879, i64 %t880)
  %t882 = call i64 @"print_f64"(i64 %t881)
  %t883 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.98)
  %t884 = ptrtoint ptr %t883 to i64
  %t885 = inttoptr i64 %t884 to ptr
  call void @intrinsic_println(ptr %t885)
  %t886 = load i64, ptr %local.astar_24.641
  store i64 %t886, ptr %local.prev_astar.639
  store i64 32, ptr %local.n32.642
  %t887 = load i64, ptr %local.n32.642
  %t888 = load i64, ptr %local.nu.621
  %t889 = load i64, ptr %local.sigma.622
  %t890 = load i64, ptr %local.lambda.623
  %t891 = load i64, ptr %local.lambda2.624
  %t892 = load i64, ptr %local.dt.625
  %t893 = load i64, ptr %local.max_steps.626
  %t894 = call i64 @"find_astar"(i64 %t887, i64 %t888, i64 %t889, i64 %t890, i64 %t891, i64 %t892, i64 %t893)
  store i64 %t894, ptr %local.astar_32.643
  %t895 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.99)
  %t896 = ptrtoint ptr %t895 to i64
  %t897 = inttoptr i64 %t896 to ptr
  call void @intrinsic_print(ptr %t897)
  %t898 = load i64, ptr %local.astar_32.643
  %t899 = call i64 @"print_f64"(i64 %t898)
  %t900 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.100)
  %t901 = ptrtoint ptr %t900 to i64
  %t902 = inttoptr i64 %t901 to ptr
  call void @intrinsic_print(ptr %t902)
  %t903 = load i64, ptr %local.astar_32.643
  %t904 = load i64, ptr %local.prev_astar.639
  %t905 = call i64 @"sx_f64_sub"(i64 %t903, i64 %t904)
  %t906 = call i64 @"print_f64"(i64 %t905)
  %t907 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.101)
  %t908 = ptrtoint ptr %t907 to i64
  %t909 = inttoptr i64 %t908 to ptr
  call void @intrinsic_println(ptr %t909)
  %t910 = load i64, ptr %local.astar_32.643
  store i64 %t910, ptr %local.prev_astar.639
  store i64 48, ptr %local.n48.644
  %t911 = load i64, ptr %local.n48.644
  %t912 = load i64, ptr %local.nu.621
  %t913 = load i64, ptr %local.sigma.622
  %t914 = load i64, ptr %local.lambda.623
  %t915 = load i64, ptr %local.lambda2.624
  %t916 = load i64, ptr %local.dt.625
  %t917 = load i64, ptr %local.max_steps.626
  %t918 = call i64 @"find_astar"(i64 %t911, i64 %t912, i64 %t913, i64 %t914, i64 %t915, i64 %t916, i64 %t917)
  store i64 %t918, ptr %local.astar_48.645
  %t919 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.102)
  %t920 = ptrtoint ptr %t919 to i64
  %t921 = inttoptr i64 %t920 to ptr
  call void @intrinsic_print(ptr %t921)
  %t922 = load i64, ptr %local.astar_48.645
  %t923 = call i64 @"print_f64"(i64 %t922)
  %t924 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.103)
  %t925 = ptrtoint ptr %t924 to i64
  %t926 = inttoptr i64 %t925 to ptr
  call void @intrinsic_print(ptr %t926)
  %t927 = load i64, ptr %local.astar_48.645
  %t928 = load i64, ptr %local.prev_astar.639
  %t929 = call i64 @"sx_f64_sub"(i64 %t927, i64 %t928)
  %t930 = call i64 @"print_f64"(i64 %t929)
  %t931 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.104)
  %t932 = ptrtoint ptr %t931 to i64
  %t933 = inttoptr i64 %t932 to ptr
  call void @intrinsic_println(ptr %t933)
  %t934 = load i64, ptr %local.astar_48.645
  store i64 %t934, ptr %local.prev_astar.639
  store i64 64, ptr %local.n64.646
  %t935 = load i64, ptr %local.n64.646
  %t936 = load i64, ptr %local.nu.621
  %t937 = load i64, ptr %local.sigma.622
  %t938 = load i64, ptr %local.lambda.623
  %t939 = load i64, ptr %local.lambda2.624
  %t940 = load i64, ptr %local.dt.625
  %t941 = load i64, ptr %local.max_steps.626
  %t942 = call i64 @"find_astar"(i64 %t935, i64 %t936, i64 %t937, i64 %t938, i64 %t939, i64 %t940, i64 %t941)
  store i64 %t942, ptr %local.astar_64.647
  %t943 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.105)
  %t944 = ptrtoint ptr %t943 to i64
  %t945 = inttoptr i64 %t944 to ptr
  call void @intrinsic_print(ptr %t945)
  %t946 = load i64, ptr %local.astar_64.647
  %t947 = call i64 @"print_f64"(i64 %t946)
  %t948 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.106)
  %t949 = ptrtoint ptr %t948 to i64
  %t950 = inttoptr i64 %t949 to ptr
  call void @intrinsic_print(ptr %t950)
  %t951 = load i64, ptr %local.astar_64.647
  %t952 = load i64, ptr %local.prev_astar.639
  %t953 = call i64 @"sx_f64_sub"(i64 %t951, i64 %t952)
  %t954 = call i64 @"print_f64"(i64 %t953)
  %t955 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.107)
  %t956 = ptrtoint ptr %t955 to i64
  %t957 = inttoptr i64 %t956 to ptr
  call void @intrinsic_println(ptr %t957)
  %t958 = load i64, ptr %local.astar_64.647
  store i64 %t958, ptr %local.prev_astar.639
  store i64 96, ptr %local.n96.648
  %t959 = load i64, ptr %local.n96.648
  %t960 = load i64, ptr %local.nu.621
  %t961 = load i64, ptr %local.sigma.622
  %t962 = load i64, ptr %local.lambda.623
  %t963 = load i64, ptr %local.lambda2.624
  %t964 = load i64, ptr %local.dt.625
  %t965 = load i64, ptr %local.max_steps.626
  %t966 = call i64 @"find_astar"(i64 %t959, i64 %t960, i64 %t961, i64 %t962, i64 %t963, i64 %t964, i64 %t965)
  store i64 %t966, ptr %local.astar_96.649
  %t967 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.108)
  %t968 = ptrtoint ptr %t967 to i64
  %t969 = inttoptr i64 %t968 to ptr
  call void @intrinsic_print(ptr %t969)
  %t970 = load i64, ptr %local.astar_96.649
  %t971 = call i64 @"print_f64"(i64 %t970)
  %t972 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.109)
  %t973 = ptrtoint ptr %t972 to i64
  %t974 = inttoptr i64 %t973 to ptr
  call void @intrinsic_print(ptr %t974)
  %t975 = load i64, ptr %local.astar_96.649
  %t976 = load i64, ptr %local.prev_astar.639
  %t977 = call i64 @"sx_f64_sub"(i64 %t975, i64 %t976)
  %t978 = call i64 @"print_f64"(i64 %t977)
  %t979 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.110)
  %t980 = ptrtoint ptr %t979 to i64
  %t981 = inttoptr i64 %t980 to ptr
  call void @intrinsic_println(ptr %t981)
  %t982 = load i64, ptr %local.astar_96.649
  store i64 %t982, ptr %local.prev_astar.639
  store i64 128, ptr %local.n128.650
  %t983 = load i64, ptr %local.n128.650
  %t984 = load i64, ptr %local.nu.621
  %t985 = load i64, ptr %local.sigma.622
  %t986 = load i64, ptr %local.lambda.623
  %t987 = load i64, ptr %local.lambda2.624
  %t988 = load i64, ptr %local.dt.625
  %t989 = load i64, ptr %local.max_steps.626
  %t990 = call i64 @"find_astar"(i64 %t983, i64 %t984, i64 %t985, i64 %t986, i64 %t987, i64 %t988, i64 %t989)
  store i64 %t990, ptr %local.astar_128.651
  %t991 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.111)
  %t992 = ptrtoint ptr %t991 to i64
  %t993 = inttoptr i64 %t992 to ptr
  call void @intrinsic_print(ptr %t993)
  %t994 = load i64, ptr %local.astar_128.651
  %t995 = call i64 @"print_f64"(i64 %t994)
  %t996 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.112)
  %t997 = ptrtoint ptr %t996 to i64
  %t998 = inttoptr i64 %t997 to ptr
  call void @intrinsic_print(ptr %t998)
  %t999 = load i64, ptr %local.astar_128.651
  %t1000 = load i64, ptr %local.prev_astar.639
  %t1001 = call i64 @"sx_f64_sub"(i64 %t999, i64 %t1000)
  %t1002 = call i64 @"print_f64"(i64 %t1001)
  %t1003 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.113)
  %t1004 = ptrtoint ptr %t1003 to i64
  %t1005 = inttoptr i64 %t1004 to ptr
  call void @intrinsic_println(ptr %t1005)
  %t1006 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.114)
  %t1007 = ptrtoint ptr %t1006 to i64
  %t1008 = inttoptr i64 %t1007 to ptr
  call void @intrinsic_println(ptr %t1008)
  %t1009 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.115)
  %t1010 = ptrtoint ptr %t1009 to i64
  %t1011 = inttoptr i64 %t1010 to ptr
  call void @intrinsic_println(ptr %t1011)
  %t1012 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.116)
  %t1013 = ptrtoint ptr %t1012 to i64
  %t1014 = inttoptr i64 %t1013 to ptr
  call void @intrinsic_println(ptr %t1014)
  store i64 0, ptr %local.violations.652
  store i64 0, ptr %local.transitions.653
  %t1015 = load i64, ptr %local.astar_8.631
  %t1016 = load i64, ptr %local.astar_6.628
  %t1017 = call i64 @"sx_f64_ge"(i64 %t1015, i64 %t1016)
  %t1018 = icmp ne i64 %t1017, 0
  br i1 %t1018, label %then22, label %else22
then22:
  %t1019 = load i64, ptr %local.transitions.653
  %t1020 = add i64 %t1019, 1
  store i64 %t1020, ptr %local.transitions.653
  br label %then22_end
then22_end:
  br label %endif22
else22:
  %t1021 = load i64, ptr %local.violations.652
  %t1022 = add i64 %t1021, 1
  store i64 %t1022, ptr %local.violations.652
  %t1023 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.117)
  %t1024 = ptrtoint ptr %t1023 to i64
  %t1025 = inttoptr i64 %t1024 to ptr
  call void @intrinsic_print(ptr %t1025)
  %t1026 = load i64, ptr %local.astar_8.631
  %t1027 = call i64 @"print_f64"(i64 %t1026)
  %t1028 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.118)
  %t1029 = ptrtoint ptr %t1028 to i64
  %t1030 = inttoptr i64 %t1029 to ptr
  call void @intrinsic_print(ptr %t1030)
  %t1031 = load i64, ptr %local.astar_6.628
  %t1032 = call i64 @"print_f64"(i64 %t1031)
  %t1033 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.119)
  %t1034 = ptrtoint ptr %t1033 to i64
  %t1035 = inttoptr i64 %t1034 to ptr
  call void @intrinsic_println(ptr %t1035)
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t1036 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t1037 = load i64, ptr %local.astar_12.634
  %t1038 = load i64, ptr %local.astar_8.631
  %t1039 = call i64 @"sx_f64_ge"(i64 %t1037, i64 %t1038)
  %t1040 = icmp ne i64 %t1039, 0
  br i1 %t1040, label %then23, label %else23
then23:
  %t1041 = load i64, ptr %local.transitions.653
  %t1042 = add i64 %t1041, 1
  store i64 %t1042, ptr %local.transitions.653
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t1043 = load i64, ptr %local.violations.652
  %t1044 = add i64 %t1043, 1
  store i64 %t1044, ptr %local.violations.652
  %t1045 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.120)
  %t1046 = ptrtoint ptr %t1045 to i64
  %t1047 = inttoptr i64 %t1046 to ptr
  call void @intrinsic_print(ptr %t1047)
  %t1048 = load i64, ptr %local.astar_12.634
  %t1049 = call i64 @"print_f64"(i64 %t1048)
  %t1050 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.121)
  %t1051 = ptrtoint ptr %t1050 to i64
  %t1052 = inttoptr i64 %t1051 to ptr
  call void @intrinsic_print(ptr %t1052)
  %t1053 = load i64, ptr %local.astar_8.631
  %t1054 = call i64 @"print_f64"(i64 %t1053)
  %t1055 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.122)
  %t1056 = ptrtoint ptr %t1055 to i64
  %t1057 = inttoptr i64 %t1056 to ptr
  call void @intrinsic_println(ptr %t1057)
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t1058 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t1059 = load i64, ptr %local.astar_16.637
  %t1060 = load i64, ptr %local.astar_12.634
  %t1061 = call i64 @"sx_f64_ge"(i64 %t1059, i64 %t1060)
  %t1062 = icmp ne i64 %t1061, 0
  br i1 %t1062, label %then24, label %else24
then24:
  %t1063 = load i64, ptr %local.transitions.653
  %t1064 = add i64 %t1063, 1
  store i64 %t1064, ptr %local.transitions.653
  br label %then24_end
then24_end:
  br label %endif24
else24:
  %t1065 = load i64, ptr %local.violations.652
  %t1066 = add i64 %t1065, 1
  store i64 %t1066, ptr %local.violations.652
  %t1067 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.123)
  %t1068 = ptrtoint ptr %t1067 to i64
  %t1069 = inttoptr i64 %t1068 to ptr
  call void @intrinsic_print(ptr %t1069)
  %t1070 = load i64, ptr %local.astar_16.637
  %t1071 = call i64 @"print_f64"(i64 %t1070)
  %t1072 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.124)
  %t1073 = ptrtoint ptr %t1072 to i64
  %t1074 = inttoptr i64 %t1073 to ptr
  call void @intrinsic_print(ptr %t1074)
  %t1075 = load i64, ptr %local.astar_12.634
  %t1076 = call i64 @"print_f64"(i64 %t1075)
  %t1077 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.125)
  %t1078 = ptrtoint ptr %t1077 to i64
  %t1079 = inttoptr i64 %t1078 to ptr
  call void @intrinsic_println(ptr %t1079)
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t1080 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t1081 = load i64, ptr %local.astar_24.641
  %t1082 = load i64, ptr %local.astar_16.637
  %t1083 = call i64 @"sx_f64_ge"(i64 %t1081, i64 %t1082)
  %t1084 = icmp ne i64 %t1083, 0
  br i1 %t1084, label %then25, label %else25
then25:
  %t1085 = load i64, ptr %local.transitions.653
  %t1086 = add i64 %t1085, 1
  store i64 %t1086, ptr %local.transitions.653
  br label %then25_end
then25_end:
  br label %endif25
else25:
  %t1087 = load i64, ptr %local.violations.652
  %t1088 = add i64 %t1087, 1
  store i64 %t1088, ptr %local.violations.652
  %t1089 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.126)
  %t1090 = ptrtoint ptr %t1089 to i64
  %t1091 = inttoptr i64 %t1090 to ptr
  call void @intrinsic_print(ptr %t1091)
  %t1092 = load i64, ptr %local.astar_24.641
  %t1093 = call i64 @"print_f64"(i64 %t1092)
  %t1094 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.127)
  %t1095 = ptrtoint ptr %t1094 to i64
  %t1096 = inttoptr i64 %t1095 to ptr
  call void @intrinsic_print(ptr %t1096)
  %t1097 = load i64, ptr %local.astar_16.637
  %t1098 = call i64 @"print_f64"(i64 %t1097)
  %t1099 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.128)
  %t1100 = ptrtoint ptr %t1099 to i64
  %t1101 = inttoptr i64 %t1100 to ptr
  call void @intrinsic_println(ptr %t1101)
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t1102 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t1103 = load i64, ptr %local.astar_32.643
  %t1104 = load i64, ptr %local.astar_24.641
  %t1105 = call i64 @"sx_f64_ge"(i64 %t1103, i64 %t1104)
  %t1106 = icmp ne i64 %t1105, 0
  br i1 %t1106, label %then26, label %else26
then26:
  %t1107 = load i64, ptr %local.transitions.653
  %t1108 = add i64 %t1107, 1
  store i64 %t1108, ptr %local.transitions.653
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t1109 = load i64, ptr %local.violations.652
  %t1110 = add i64 %t1109, 1
  store i64 %t1110, ptr %local.violations.652
  %t1111 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.129)
  %t1112 = ptrtoint ptr %t1111 to i64
  %t1113 = inttoptr i64 %t1112 to ptr
  call void @intrinsic_print(ptr %t1113)
  %t1114 = load i64, ptr %local.astar_32.643
  %t1115 = call i64 @"print_f64"(i64 %t1114)
  %t1116 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.130)
  %t1117 = ptrtoint ptr %t1116 to i64
  %t1118 = inttoptr i64 %t1117 to ptr
  call void @intrinsic_print(ptr %t1118)
  %t1119 = load i64, ptr %local.astar_24.641
  %t1120 = call i64 @"print_f64"(i64 %t1119)
  %t1121 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.131)
  %t1122 = ptrtoint ptr %t1121 to i64
  %t1123 = inttoptr i64 %t1122 to ptr
  call void @intrinsic_println(ptr %t1123)
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t1124 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t1125 = load i64, ptr %local.astar_48.645
  %t1126 = load i64, ptr %local.astar_32.643
  %t1127 = call i64 @"sx_f64_ge"(i64 %t1125, i64 %t1126)
  %t1128 = icmp ne i64 %t1127, 0
  br i1 %t1128, label %then27, label %else27
then27:
  %t1129 = load i64, ptr %local.transitions.653
  %t1130 = add i64 %t1129, 1
  store i64 %t1130, ptr %local.transitions.653
  br label %then27_end
then27_end:
  br label %endif27
else27:
  %t1131 = load i64, ptr %local.violations.652
  %t1132 = add i64 %t1131, 1
  store i64 %t1132, ptr %local.violations.652
  %t1133 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.132)
  %t1134 = ptrtoint ptr %t1133 to i64
  %t1135 = inttoptr i64 %t1134 to ptr
  call void @intrinsic_print(ptr %t1135)
  %t1136 = load i64, ptr %local.astar_48.645
  %t1137 = call i64 @"print_f64"(i64 %t1136)
  %t1138 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.133)
  %t1139 = ptrtoint ptr %t1138 to i64
  %t1140 = inttoptr i64 %t1139 to ptr
  call void @intrinsic_print(ptr %t1140)
  %t1141 = load i64, ptr %local.astar_32.643
  %t1142 = call i64 @"print_f64"(i64 %t1141)
  %t1143 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.134)
  %t1144 = ptrtoint ptr %t1143 to i64
  %t1145 = inttoptr i64 %t1144 to ptr
  call void @intrinsic_println(ptr %t1145)
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t1146 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t1147 = load i64, ptr %local.astar_64.647
  %t1148 = load i64, ptr %local.astar_48.645
  %t1149 = call i64 @"sx_f64_ge"(i64 %t1147, i64 %t1148)
  %t1150 = icmp ne i64 %t1149, 0
  br i1 %t1150, label %then28, label %else28
then28:
  %t1151 = load i64, ptr %local.transitions.653
  %t1152 = add i64 %t1151, 1
  store i64 %t1152, ptr %local.transitions.653
  br label %then28_end
then28_end:
  br label %endif28
else28:
  %t1153 = load i64, ptr %local.violations.652
  %t1154 = add i64 %t1153, 1
  store i64 %t1154, ptr %local.violations.652
  %t1155 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.135)
  %t1156 = ptrtoint ptr %t1155 to i64
  %t1157 = inttoptr i64 %t1156 to ptr
  call void @intrinsic_print(ptr %t1157)
  %t1158 = load i64, ptr %local.astar_64.647
  %t1159 = call i64 @"print_f64"(i64 %t1158)
  %t1160 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.136)
  %t1161 = ptrtoint ptr %t1160 to i64
  %t1162 = inttoptr i64 %t1161 to ptr
  call void @intrinsic_print(ptr %t1162)
  %t1163 = load i64, ptr %local.astar_48.645
  %t1164 = call i64 @"print_f64"(i64 %t1163)
  %t1165 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.137)
  %t1166 = ptrtoint ptr %t1165 to i64
  %t1167 = inttoptr i64 %t1166 to ptr
  call void @intrinsic_println(ptr %t1167)
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1168 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t1169 = load i64, ptr %local.astar_96.649
  %t1170 = load i64, ptr %local.astar_64.647
  %t1171 = call i64 @"sx_f64_ge"(i64 %t1169, i64 %t1170)
  %t1172 = icmp ne i64 %t1171, 0
  br i1 %t1172, label %then29, label %else29
then29:
  %t1173 = load i64, ptr %local.transitions.653
  %t1174 = add i64 %t1173, 1
  store i64 %t1174, ptr %local.transitions.653
  br label %then29_end
then29_end:
  br label %endif29
else29:
  %t1175 = load i64, ptr %local.violations.652
  %t1176 = add i64 %t1175, 1
  store i64 %t1176, ptr %local.violations.652
  %t1177 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.138)
  %t1178 = ptrtoint ptr %t1177 to i64
  %t1179 = inttoptr i64 %t1178 to ptr
  call void @intrinsic_print(ptr %t1179)
  %t1180 = load i64, ptr %local.astar_96.649
  %t1181 = call i64 @"print_f64"(i64 %t1180)
  %t1182 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.139)
  %t1183 = ptrtoint ptr %t1182 to i64
  %t1184 = inttoptr i64 %t1183 to ptr
  call void @intrinsic_print(ptr %t1184)
  %t1185 = load i64, ptr %local.astar_64.647
  %t1186 = call i64 @"print_f64"(i64 %t1185)
  %t1187 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.140)
  %t1188 = ptrtoint ptr %t1187 to i64
  %t1189 = inttoptr i64 %t1188 to ptr
  call void @intrinsic_println(ptr %t1189)
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1190 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t1191 = load i64, ptr %local.astar_128.651
  %t1192 = load i64, ptr %local.astar_96.649
  %t1193 = call i64 @"sx_f64_ge"(i64 %t1191, i64 %t1192)
  %t1194 = icmp ne i64 %t1193, 0
  br i1 %t1194, label %then30, label %else30
then30:
  %t1195 = load i64, ptr %local.transitions.653
  %t1196 = add i64 %t1195, 1
  store i64 %t1196, ptr %local.transitions.653
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t1197 = load i64, ptr %local.violations.652
  %t1198 = add i64 %t1197, 1
  store i64 %t1198, ptr %local.violations.652
  %t1199 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.141)
  %t1200 = ptrtoint ptr %t1199 to i64
  %t1201 = inttoptr i64 %t1200 to ptr
  call void @intrinsic_print(ptr %t1201)
  %t1202 = load i64, ptr %local.astar_128.651
  %t1203 = call i64 @"print_f64"(i64 %t1202)
  %t1204 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.142)
  %t1205 = ptrtoint ptr %t1204 to i64
  %t1206 = inttoptr i64 %t1205 to ptr
  call void @intrinsic_print(ptr %t1206)
  %t1207 = load i64, ptr %local.astar_96.649
  %t1208 = call i64 @"print_f64"(i64 %t1207)
  %t1209 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.143)
  %t1210 = ptrtoint ptr %t1209 to i64
  %t1211 = inttoptr i64 %t1210 to ptr
  call void @intrinsic_println(ptr %t1211)
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1212 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t1213 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.144)
  %t1214 = ptrtoint ptr %t1213 to i64
  %t1215 = inttoptr i64 %t1214 to ptr
  call void @intrinsic_print(ptr %t1215)
  %t1216 = load i64, ptr %local.transitions.653
  call void @print_i64(i64 %t1216)
  %t1217 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.145)
  %t1218 = ptrtoint ptr %t1217 to i64
  %t1219 = inttoptr i64 %t1218 to ptr
  call void @intrinsic_print(ptr %t1219)
  %t1220 = load i64, ptr %local.transitions.653
  %t1221 = load i64, ptr %local.violations.652
  %t1222 = add i64 %t1220, %t1221
  call void @print_i64(i64 %t1222)
  %t1223 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.146)
  %t1224 = ptrtoint ptr %t1223 to i64
  %t1225 = inttoptr i64 %t1224 to ptr
  call void @intrinsic_println(ptr %t1225)
  %t1226 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.147)
  %t1227 = ptrtoint ptr %t1226 to i64
  %t1228 = inttoptr i64 %t1227 to ptr
  call void @intrinsic_print(ptr %t1228)
  %t1229 = load i64, ptr %local.violations.652
  call void @print_i64(i64 %t1229)
  %t1230 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.148)
  %t1231 = ptrtoint ptr %t1230 to i64
  %t1232 = inttoptr i64 %t1231 to ptr
  call void @intrinsic_println(ptr %t1232)
  %t1233 = load i64, ptr %local.violations.652
  %t1234 = icmp eq i64 %t1233, 0
  %t1235 = zext i1 %t1234 to i64
  %t1236 = icmp ne i64 %t1235, 0
  br i1 %t1236, label %then31, label %else31
then31:
  %t1237 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.149)
  %t1238 = ptrtoint ptr %t1237 to i64
  %t1239 = inttoptr i64 %t1238 to ptr
  call void @intrinsic_println(ptr %t1239)
  br label %then31_end
then31_end:
  br label %endif31
else31:
  %t1240 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.150)
  %t1241 = ptrtoint ptr %t1240 to i64
  %t1242 = inttoptr i64 %t1241 to ptr
  call void @intrinsic_println(ptr %t1242)
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1243 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t1244 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.151)
  %t1245 = ptrtoint ptr %t1244 to i64
  %t1246 = inttoptr i64 %t1245 to ptr
  call void @intrinsic_println(ptr %t1246)
  %t1247 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.152)
  %t1248 = ptrtoint ptr %t1247 to i64
  %t1249 = inttoptr i64 %t1248 to ptr
  call void @intrinsic_println(ptr %t1249)
  %t1250 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.153)
  %t1251 = ptrtoint ptr %t1250 to i64
  %t1252 = inttoptr i64 %t1251 to ptr
  call void @intrinsic_println(ptr %t1252)
  %t1253 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.154)
  %t1254 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.155)
  %t1255 = call i64 @"sx_f64_div"(i64 %t1253, i64 %t1254)
  store i64 %t1255, ptr %local.inv64.654
  %t1256 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.156)
  %t1257 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.157)
  %t1258 = call i64 @"sx_f64_div"(i64 %t1256, i64 %t1257)
  store i64 %t1258, ptr %local.inv128.655
  %t1259 = load i64, ptr %local.astar_128.651
  %t1260 = load i64, ptr %local.astar_64.647
  %t1261 = call i64 @"sx_f64_sub"(i64 %t1259, i64 %t1260)
  %t1262 = load i64, ptr %local.inv64.654
  %t1263 = load i64, ptr %local.inv128.655
  %t1264 = call i64 @"sx_f64_sub"(i64 %t1262, i64 %t1263)
  %t1265 = call i64 @"sx_f64_div"(i64 %t1261, i64 %t1264)
  store i64 %t1265, ptr %local.c_fit.656
  %t1266 = load i64, ptr %local.astar_128.651
  %t1267 = load i64, ptr %local.c_fit.656
  %t1268 = load i64, ptr %local.inv128.655
  %t1269 = call i64 @"sx_f64_mul"(i64 %t1267, i64 %t1268)
  %t1270 = call i64 @"sx_f64_add"(i64 %t1266, i64 %t1269)
  store i64 %t1270, ptr %local.a_inf.657
  %t1271 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.158)
  %t1272 = ptrtoint ptr %t1271 to i64
  %t1273 = inttoptr i64 %t1272 to ptr
  call void @intrinsic_print(ptr %t1273)
  %t1274 = load i64, ptr %local.a_inf.657
  %t1275 = call i64 @"print_f64"(i64 %t1274)
  %t1276 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.159)
  %t1277 = ptrtoint ptr %t1276 to i64
  %t1278 = inttoptr i64 %t1277 to ptr
  call void @intrinsic_print(ptr %t1278)
  %t1279 = load i64, ptr %local.c_fit.656
  %t1280 = call i64 @"print_f64"(i64 %t1279)
  %t1281 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.160)
  %t1282 = ptrtoint ptr %t1281 to i64
  %t1283 = inttoptr i64 %t1282 to ptr
  call void @intrinsic_println(ptr %t1283)
  %t1284 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.161)
  %t1285 = ptrtoint ptr %t1284 to i64
  %t1286 = inttoptr i64 %t1285 to ptr
  call void @intrinsic_println(ptr %t1286)
  %t1287 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.162)
  %t1288 = ptrtoint ptr %t1287 to i64
  %t1289 = inttoptr i64 %t1288 to ptr
  call void @intrinsic_print(ptr %t1289)
  %t1290 = load i64, ptr %local.a_inf.657
  %t1291 = call i64 @"print_f64"(i64 %t1290)
  %t1292 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.163)
  %t1293 = ptrtoint ptr %t1292 to i64
  %t1294 = inttoptr i64 %t1293 to ptr
  call void @intrinsic_println(ptr %t1294)
  %t1295 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.164)
  %t1296 = ptrtoint ptr %t1295 to i64
  %t1297 = inttoptr i64 %t1296 to ptr
  call void @intrinsic_println(ptr %t1297)
  %t1298 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.165)
  %t1299 = ptrtoint ptr %t1298 to i64
  %t1300 = inttoptr i64 %t1299 to ptr
  call void @intrinsic_println(ptr %t1300)
  %t1301 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.166)
  %t1302 = ptrtoint ptr %t1301 to i64
  %t1303 = inttoptr i64 %t1302 to ptr
  call void @intrinsic_println(ptr %t1303)
  %t1304 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.167)
  %t1305 = ptrtoint ptr %t1304 to i64
  %t1306 = inttoptr i64 %t1305 to ptr
  call void @intrinsic_print(ptr %t1306)
  %t1307 = load i64, ptr %local.astar_6.628
  %t1308 = call i64 @"print_f64"(i64 %t1307)
  %t1309 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.168)
  %t1310 = ptrtoint ptr %t1309 to i64
  %t1311 = inttoptr i64 %t1310 to ptr
  call void @intrinsic_print(ptr %t1311)
  %t1312 = load i64, ptr %local.a_inf.657
  %t1313 = load i64, ptr %local.c_fit.656
  %t1314 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.169)
  %t1315 = call i64 @"sx_f64_div"(i64 %t1313, i64 %t1314)
  %t1316 = call i64 @"sx_f64_sub"(i64 %t1312, i64 %t1315)
  store i64 %t1316, ptr %local.pred_6.658
  %t1317 = load i64, ptr %local.pred_6.658
  %t1318 = call i64 @"print_f64"(i64 %t1317)
  %t1319 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.170)
  %t1320 = ptrtoint ptr %t1319 to i64
  %t1321 = inttoptr i64 %t1320 to ptr
  call void @intrinsic_print(ptr %t1321)
  %t1322 = load i64, ptr %local.astar_6.628
  %t1323 = load i64, ptr %local.pred_6.658
  %t1324 = call i64 @"sx_f64_sub"(i64 %t1322, i64 %t1323)
  %t1325 = call i64 @"abs_f64"(i64 %t1324)
  %t1326 = call i64 @"print_f64"(i64 %t1325)
  %t1327 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.171)
  %t1328 = ptrtoint ptr %t1327 to i64
  %t1329 = inttoptr i64 %t1328 to ptr
  call void @intrinsic_println(ptr %t1329)
  %t1330 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.172)
  %t1331 = ptrtoint ptr %t1330 to i64
  %t1332 = inttoptr i64 %t1331 to ptr
  call void @intrinsic_print(ptr %t1332)
  %t1333 = load i64, ptr %local.astar_16.637
  %t1334 = call i64 @"print_f64"(i64 %t1333)
  %t1335 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.173)
  %t1336 = ptrtoint ptr %t1335 to i64
  %t1337 = inttoptr i64 %t1336 to ptr
  call void @intrinsic_print(ptr %t1337)
  %t1338 = load i64, ptr %local.a_inf.657
  %t1339 = load i64, ptr %local.c_fit.656
  %t1340 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.174)
  %t1341 = call i64 @"sx_f64_div"(i64 %t1339, i64 %t1340)
  %t1342 = call i64 @"sx_f64_sub"(i64 %t1338, i64 %t1341)
  store i64 %t1342, ptr %local.pred_16.659
  %t1343 = load i64, ptr %local.pred_16.659
  %t1344 = call i64 @"print_f64"(i64 %t1343)
  %t1345 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.175)
  %t1346 = ptrtoint ptr %t1345 to i64
  %t1347 = inttoptr i64 %t1346 to ptr
  call void @intrinsic_print(ptr %t1347)
  %t1348 = load i64, ptr %local.astar_16.637
  %t1349 = load i64, ptr %local.pred_16.659
  %t1350 = call i64 @"sx_f64_sub"(i64 %t1348, i64 %t1349)
  %t1351 = call i64 @"abs_f64"(i64 %t1350)
  %t1352 = call i64 @"print_f64"(i64 %t1351)
  %t1353 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.176)
  %t1354 = ptrtoint ptr %t1353 to i64
  %t1355 = inttoptr i64 %t1354 to ptr
  call void @intrinsic_println(ptr %t1355)
  %t1356 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.177)
  %t1357 = ptrtoint ptr %t1356 to i64
  %t1358 = inttoptr i64 %t1357 to ptr
  call void @intrinsic_print(ptr %t1358)
  %t1359 = load i64, ptr %local.astar_48.645
  %t1360 = call i64 @"print_f64"(i64 %t1359)
  %t1361 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.178)
  %t1362 = ptrtoint ptr %t1361 to i64
  %t1363 = inttoptr i64 %t1362 to ptr
  call void @intrinsic_print(ptr %t1363)
  %t1364 = load i64, ptr %local.a_inf.657
  %t1365 = load i64, ptr %local.c_fit.656
  %t1366 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.179)
  %t1367 = call i64 @"sx_f64_div"(i64 %t1365, i64 %t1366)
  %t1368 = call i64 @"sx_f64_sub"(i64 %t1364, i64 %t1367)
  store i64 %t1368, ptr %local.pred_48.660
  %t1369 = load i64, ptr %local.pred_48.660
  %t1370 = call i64 @"print_f64"(i64 %t1369)
  %t1371 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.180)
  %t1372 = ptrtoint ptr %t1371 to i64
  %t1373 = inttoptr i64 %t1372 to ptr
  call void @intrinsic_print(ptr %t1373)
  %t1374 = load i64, ptr %local.astar_48.645
  %t1375 = load i64, ptr %local.pred_48.660
  %t1376 = call i64 @"sx_f64_sub"(i64 %t1374, i64 %t1375)
  %t1377 = call i64 @"abs_f64"(i64 %t1376)
  %t1378 = call i64 @"print_f64"(i64 %t1377)
  %t1379 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.181)
  %t1380 = ptrtoint ptr %t1379 to i64
  %t1381 = inttoptr i64 %t1380 to ptr
  call void @intrinsic_println(ptr %t1381)
  %t1382 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.182)
  %t1383 = ptrtoint ptr %t1382 to i64
  %t1384 = inttoptr i64 %t1383 to ptr
  call void @intrinsic_print(ptr %t1384)
  %t1385 = load i64, ptr %local.astar_128.651
  %t1386 = call i64 @"print_f64"(i64 %t1385)
  %t1387 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.183)
  %t1388 = ptrtoint ptr %t1387 to i64
  %t1389 = inttoptr i64 %t1388 to ptr
  call void @intrinsic_print(ptr %t1389)
  %t1390 = load i64, ptr %local.a_inf.657
  %t1391 = load i64, ptr %local.c_fit.656
  %t1392 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.184)
  %t1393 = call i64 @"sx_f64_div"(i64 %t1391, i64 %t1392)
  %t1394 = call i64 @"sx_f64_sub"(i64 %t1390, i64 %t1393)
  store i64 %t1394, ptr %local.pred_128.661
  %t1395 = load i64, ptr %local.pred_128.661
  %t1396 = call i64 @"print_f64"(i64 %t1395)
  %t1397 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.185)
  %t1398 = ptrtoint ptr %t1397 to i64
  %t1399 = inttoptr i64 %t1398 to ptr
  call void @intrinsic_print(ptr %t1399)
  %t1400 = load i64, ptr %local.astar_128.651
  %t1401 = load i64, ptr %local.pred_128.661
  %t1402 = call i64 @"sx_f64_sub"(i64 %t1400, i64 %t1401)
  %t1403 = call i64 @"abs_f64"(i64 %t1402)
  %t1404 = call i64 @"print_f64"(i64 %t1403)
  %t1405 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.186)
  %t1406 = ptrtoint ptr %t1405 to i64
  %t1407 = inttoptr i64 %t1406 to ptr
  call void @intrinsic_println(ptr %t1407)
  %t1408 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.187)
  %t1409 = ptrtoint ptr %t1408 to i64
  %t1410 = inttoptr i64 %t1409 to ptr
  call void @intrinsic_println(ptr %t1410)
  %t1411 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.188)
  %t1412 = ptrtoint ptr %t1411 to i64
  %t1413 = inttoptr i64 %t1412 to ptr
  call void @intrinsic_println(ptr %t1413)
  %t1414 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.189)
  %t1415 = ptrtoint ptr %t1414 to i64
  %t1416 = inttoptr i64 %t1415 to ptr
  call void @intrinsic_print(ptr %t1416)
  %t1417 = load i64, ptr %local.a_inf.657
  %t1418 = load i64, ptr %local.c_fit.656
  %t1419 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.190)
  %t1420 = call i64 @"sx_f64_div"(i64 %t1418, i64 %t1419)
  %t1421 = call i64 @"sx_f64_sub"(i64 %t1417, i64 %t1420)
  %t1422 = call i64 @"print_f64"(i64 %t1421)
  %t1423 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.191)
  %t1424 = ptrtoint ptr %t1423 to i64
  %t1425 = inttoptr i64 %t1424 to ptr
  call void @intrinsic_println(ptr %t1425)
  %t1426 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.192)
  %t1427 = ptrtoint ptr %t1426 to i64
  %t1428 = inttoptr i64 %t1427 to ptr
  call void @intrinsic_print(ptr %t1428)
  %t1429 = load i64, ptr %local.a_inf.657
  %t1430 = load i64, ptr %local.c_fit.656
  %t1431 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.193)
  %t1432 = call i64 @"sx_f64_div"(i64 %t1430, i64 %t1431)
  %t1433 = call i64 @"sx_f64_sub"(i64 %t1429, i64 %t1432)
  %t1434 = call i64 @"print_f64"(i64 %t1433)
  %t1435 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.194)
  %t1436 = ptrtoint ptr %t1435 to i64
  %t1437 = inttoptr i64 %t1436 to ptr
  call void @intrinsic_println(ptr %t1437)
  %t1438 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.195)
  %t1439 = ptrtoint ptr %t1438 to i64
  %t1440 = inttoptr i64 %t1439 to ptr
  call void @intrinsic_print(ptr %t1440)
  %t1441 = load i64, ptr %local.a_inf.657
  %t1442 = load i64, ptr %local.c_fit.656
  %t1443 = call i64 @f64_parse(ptr @.str.galerkin_n_mode.196)
  %t1444 = call i64 @"sx_f64_div"(i64 %t1442, i64 %t1443)
  %t1445 = call i64 @"sx_f64_sub"(i64 %t1441, i64 %t1444)
  %t1446 = call i64 @"print_f64"(i64 %t1445)
  %t1447 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.197)
  %t1448 = ptrtoint ptr %t1447 to i64
  %t1449 = inttoptr i64 %t1448 to ptr
  call void @intrinsic_println(ptr %t1449)
  %t1450 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.198)
  %t1451 = ptrtoint ptr %t1450 to i64
  %t1452 = inttoptr i64 %t1451 to ptr
  call void @intrinsic_print(ptr %t1452)
  %t1453 = load i64, ptr %local.a_inf.657
  %t1454 = call i64 @"print_f64"(i64 %t1453)
  %t1455 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.199)
  %t1456 = ptrtoint ptr %t1455 to i64
  %t1457 = inttoptr i64 %t1456 to ptr
  call void @intrinsic_println(ptr %t1457)
  %t1458 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.200)
  %t1459 = ptrtoint ptr %t1458 to i64
  %t1460 = inttoptr i64 %t1459 to ptr
  call void @intrinsic_println(ptr %t1460)
  %t1461 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.201)
  %t1462 = ptrtoint ptr %t1461 to i64
  %t1463 = inttoptr i64 %t1462 to ptr
  call void @intrinsic_println(ptr %t1463)
  %t1464 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.202)
  %t1465 = ptrtoint ptr %t1464 to i64
  %t1466 = inttoptr i64 %t1465 to ptr
  call void @intrinsic_println(ptr %t1466)
  %t1467 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.203)
  %t1468 = ptrtoint ptr %t1467 to i64
  %t1469 = inttoptr i64 %t1468 to ptr
  call void @intrinsic_println(ptr %t1469)
  %t1470 = load i64, ptr %local.violations.652
  %t1471 = icmp eq i64 %t1470, 0
  %t1472 = zext i1 %t1471 to i64
  %t1473 = icmp ne i64 %t1472, 0
  br i1 %t1473, label %then32, label %else32
then32:
  %t1474 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.204)
  %t1475 = ptrtoint ptr %t1474 to i64
  %t1476 = inttoptr i64 %t1475 to ptr
  call void @intrinsic_println(ptr %t1476)
  %t1477 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.205)
  %t1478 = ptrtoint ptr %t1477 to i64
  %t1479 = inttoptr i64 %t1478 to ptr
  call void @intrinsic_print(ptr %t1479)
  %t1480 = load i64, ptr %local.a_inf.657
  %t1481 = call i64 @"print_f64"(i64 %t1480)
  %t1482 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.206)
  %t1483 = ptrtoint ptr %t1482 to i64
  %t1484 = inttoptr i64 %t1483 to ptr
  call void @intrinsic_println(ptr %t1484)
  %t1485 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.207)
  %t1486 = ptrtoint ptr %t1485 to i64
  %t1487 = inttoptr i64 %t1486 to ptr
  call void @intrinsic_println(ptr %t1487)
  br label %then32_end
then32_end:
  br label %endif32
else32:
  %t1488 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.208)
  %t1489 = ptrtoint ptr %t1488 to i64
  %t1490 = inttoptr i64 %t1489 to ptr
  call void @intrinsic_println(ptr %t1490)
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1491 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t1492 = call ptr @intrinsic_string_new(ptr @.str.galerkin_n_mode.209)
  %t1493 = ptrtoint ptr %t1492 to i64
  %t1494 = inttoptr i64 %t1493 to ptr
  call void @intrinsic_println(ptr %t1494)
  ret i64 0
}


; String constants
@.str.galerkin_n_mode.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.4 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.galerkin_n_mode.5 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.galerkin_n_mode.6 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.galerkin_n_mode.7 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.galerkin_n_mode.8 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.galerkin_n_mode.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.10 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.galerkin_n_mode.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.19 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.22 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.galerkin_n_mode.23 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.galerkin_n_mode.24 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.galerkin_n_mode.25 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.galerkin_n_mode.26 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.galerkin_n_mode.27 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.galerkin_n_mode.28 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.galerkin_n_mode.29 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.galerkin_n_mode.30 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.galerkin_n_mode.31 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.galerkin_n_mode.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.galerkin_n_mode.33 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.galerkin_n_mode.34 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.galerkin_n_mode.35 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.galerkin_n_mode.36 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.galerkin_n_mode.37 = private unnamed_addr constant [7 x i8] c"5000.0\00"
@.str.galerkin_n_mode.38 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.galerkin_n_mode.39 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.galerkin_n_mode.40 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.galerkin_n_mode.41 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.galerkin_n_mode.42 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.galerkin_n_mode.43 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.galerkin_n_mode.44 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.galerkin_n_mode.45 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.galerkin_n_mode.46 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.galerkin_n_mode.47 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.galerkin_n_mode.48 = private unnamed_addr constant [61 x i8] c"#  GENERALISED N-MODE GALERKIN SOLVER                      #\00"
@.str.galerkin_n_mode.49 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.galerkin_n_mode.50 = private unnamed_addr constant [61 x i8] c"#  Single solver for arbitrary N, replacing hand-coded     #\00"
@.str.galerkin_n_mode.51 = private unnamed_addr constant [61 x i8] c"#  step6/step8/step16 functions.                           #\00"
@.str.galerkin_n_mode.52 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.galerkin_n_mode.53 = private unnamed_addr constant [61 x i8] c"#  Phase 1: Validate against known A* values               #\00"
@.str.galerkin_n_mode.54 = private unnamed_addr constant [60 x i8] c"#  Phase 2: Extend to N = 48, 64, 96, 128                 #\00"
@.str.galerkin_n_mode.55 = private unnamed_addr constant [61 x i8] c"#  Phase 3: Monotonicity test across all N                 #\00"
@.str.galerkin_n_mode.56 = private unnamed_addr constant [61 x i8] c"#  Phase 4: Functional form fit                            #\00"
@.str.galerkin_n_mode.57 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.galerkin_n_mode.58 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.59 = private unnamed_addr constant [30 x i8] c"  === Phase 1: Validation ===\00"
@.str.galerkin_n_mode.60 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.61 = private unnamed_addr constant [51 x i8] c"  N_modes  K_max  A*(gen)      A*(known)    Match?\00"
@.str.galerkin_n_mode.62 = private unnamed_addr constant [51 x i8] c"  ------   -----  ----------   ----------   ------\00"
@.str.galerkin_n_mode.63 = private unnamed_addr constant [19 x i8] c"  6        3      \00"
@.str.galerkin_n_mode.64 = private unnamed_addr constant [18 x i8] c"   ~1.19         \00"
@.str.galerkin_n_mode.65 = private unnamed_addr constant [5 x i8] c"1.19\00"
@.str.galerkin_n_mode.66 = private unnamed_addr constant [5 x i8] c"1.19\00"
@.str.galerkin_n_mode.67 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.galerkin_n_mode.68 = private unnamed_addr constant [8 x i8] c"YES ✓\00"
@.str.galerkin_n_mode.69 = private unnamed_addr constant [3 x i8] c"NO\00"
@.str.galerkin_n_mode.70 = private unnamed_addr constant [19 x i8] c"  8        4      \00"
@.str.galerkin_n_mode.71 = private unnamed_addr constant [18 x i8] c"   ~1.20         \00"
@.str.galerkin_n_mode.72 = private unnamed_addr constant [5 x i8] c"1.20\00"
@.str.galerkin_n_mode.73 = private unnamed_addr constant [5 x i8] c"1.20\00"
@.str.galerkin_n_mode.74 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.galerkin_n_mode.75 = private unnamed_addr constant [8 x i8] c"YES ✓\00"
@.str.galerkin_n_mode.76 = private unnamed_addr constant [3 x i8] c"NO\00"
@.str.galerkin_n_mode.77 = private unnamed_addr constant [19 x i8] c"  12       6      \00"
@.str.galerkin_n_mode.78 = private unnamed_addr constant [18 x i8] c"   ~1.20         \00"
@.str.galerkin_n_mode.79 = private unnamed_addr constant [5 x i8] c"1.20\00"
@.str.galerkin_n_mode.80 = private unnamed_addr constant [5 x i8] c"1.20\00"
@.str.galerkin_n_mode.81 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.galerkin_n_mode.82 = private unnamed_addr constant [8 x i8] c"YES ✓\00"
@.str.galerkin_n_mode.83 = private unnamed_addr constant [3 x i8] c"NO\00"
@.str.galerkin_n_mode.84 = private unnamed_addr constant [19 x i8] c"  16       8      \00"
@.str.galerkin_n_mode.85 = private unnamed_addr constant [18 x i8] c"   ~1.20         \00"
@.str.galerkin_n_mode.86 = private unnamed_addr constant [5 x i8] c"1.20\00"
@.str.galerkin_n_mode.87 = private unnamed_addr constant [5 x i8] c"1.20\00"
@.str.galerkin_n_mode.88 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.galerkin_n_mode.89 = private unnamed_addr constant [8 x i8] c"YES ✓\00"
@.str.galerkin_n_mode.90 = private unnamed_addr constant [3 x i8] c"NO\00"
@.str.galerkin_n_mode.91 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.92 = private unnamed_addr constant [41 x i8] c"  === Phase 2: Extension to higher N ===\00"
@.str.galerkin_n_mode.93 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.94 = private unnamed_addr constant [40 x i8] c"  N_modes  K_max  A*           Delta_A*\00"
@.str.galerkin_n_mode.95 = private unnamed_addr constant [42 x i8] c"  ------   -----  ----------   ----------\00"
@.str.galerkin_n_mode.96 = private unnamed_addr constant [19 x i8] c"  24       12     \00"
@.str.galerkin_n_mode.97 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.98 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.99 = private unnamed_addr constant [19 x i8] c"  32       16     \00"
@.str.galerkin_n_mode.100 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.101 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.102 = private unnamed_addr constant [19 x i8] c"  48       24     \00"
@.str.galerkin_n_mode.103 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.104 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.105 = private unnamed_addr constant [19 x i8] c"  64       32     \00"
@.str.galerkin_n_mode.106 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.107 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.108 = private unnamed_addr constant [19 x i8] c"  96       48     \00"
@.str.galerkin_n_mode.109 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.110 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.111 = private unnamed_addr constant [19 x i8] c"  128      64     \00"
@.str.galerkin_n_mode.112 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.113 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.114 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.115 = private unnamed_addr constant [32 x i8] c"  === Phase 3: Monotonicity ===\00"
@.str.galerkin_n_mode.116 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.117 = private unnamed_addr constant [29 x i8] c"  VIOLATION: A*(8) < A*(6): \00"
@.str.galerkin_n_mode.118 = private unnamed_addr constant [4 x i8] c" < \00"
@.str.galerkin_n_mode.119 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.120 = private unnamed_addr constant [30 x i8] c"  VIOLATION: A*(12) < A*(8): \00"
@.str.galerkin_n_mode.121 = private unnamed_addr constant [4 x i8] c" < \00"
@.str.galerkin_n_mode.122 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.123 = private unnamed_addr constant [31 x i8] c"  VIOLATION: A*(16) < A*(12): \00"
@.str.galerkin_n_mode.124 = private unnamed_addr constant [4 x i8] c" < \00"
@.str.galerkin_n_mode.125 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.126 = private unnamed_addr constant [31 x i8] c"  VIOLATION: A*(24) < A*(16): \00"
@.str.galerkin_n_mode.127 = private unnamed_addr constant [4 x i8] c" < \00"
@.str.galerkin_n_mode.128 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.129 = private unnamed_addr constant [31 x i8] c"  VIOLATION: A*(32) < A*(24): \00"
@.str.galerkin_n_mode.130 = private unnamed_addr constant [4 x i8] c" < \00"
@.str.galerkin_n_mode.131 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.132 = private unnamed_addr constant [31 x i8] c"  VIOLATION: A*(48) < A*(32): \00"
@.str.galerkin_n_mode.133 = private unnamed_addr constant [4 x i8] c" < \00"
@.str.galerkin_n_mode.134 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.135 = private unnamed_addr constant [31 x i8] c"  VIOLATION: A*(64) < A*(48): \00"
@.str.galerkin_n_mode.136 = private unnamed_addr constant [4 x i8] c" < \00"
@.str.galerkin_n_mode.137 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.138 = private unnamed_addr constant [31 x i8] c"  VIOLATION: A*(96) < A*(64): \00"
@.str.galerkin_n_mode.139 = private unnamed_addr constant [4 x i8] c" < \00"
@.str.galerkin_n_mode.140 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.141 = private unnamed_addr constant [32 x i8] c"  VIOLATION: A*(128) < A*(96): \00"
@.str.galerkin_n_mode.142 = private unnamed_addr constant [4 x i8] c" < \00"
@.str.galerkin_n_mode.143 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.144 = private unnamed_addr constant [25 x i8] c"  Monotone transitions: \00"
@.str.galerkin_n_mode.145 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.galerkin_n_mode.146 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.147 = private unnamed_addr constant [15 x i8] c"  Violations: \00"
@.str.galerkin_n_mode.148 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.149 = private unnamed_addr constant [41 x i8] c"  RESULT: A*(N) is STRICTLY MONOTONE ✓\00"
@.str.galerkin_n_mode.150 = private unnamed_addr constant [32 x i8] c"  RESULT: Monotonicity VIOLATED\00"
@.str.galerkin_n_mode.151 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.152 = private unnamed_addr constant [34 x i8] c"  === Phase 4: Asymptotic fit ===\00"
@.str.galerkin_n_mode.153 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.154 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.galerkin_n_mode.155 = private unnamed_addr constant [5 x i8] c"64.0\00"
@.str.galerkin_n_mode.156 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.galerkin_n_mode.157 = private unnamed_addr constant [6 x i8] c"128.0\00"
@.str.galerkin_n_mode.158 = private unnamed_addr constant [16 x i8] c"  Fit: A*(N) = \00"
@.str.galerkin_n_mode.159 = private unnamed_addr constant [4 x i8] c" - \00"
@.str.galerkin_n_mode.160 = private unnamed_addr constant [5 x i8] c" / N\00"
@.str.galerkin_n_mode.161 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.162 = private unnamed_addr constant [12 x i8] c"  A*_inf = \00"
@.str.galerkin_n_mode.163 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.164 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.165 = private unnamed_addr constant [47 x i8] c"  N        A*(measured)   A*(predicted)  Error\00"
@.str.galerkin_n_mode.166 = private unnamed_addr constant [52 x i8] c"  ------   ----------     ----------     ----------\00"
@.str.galerkin_n_mode.167 = private unnamed_addr constant [12 x i8] c"  6        \00"
@.str.galerkin_n_mode.168 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.169 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.galerkin_n_mode.170 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.171 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.172 = private unnamed_addr constant [12 x i8] c"  16       \00"
@.str.galerkin_n_mode.173 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.174 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.galerkin_n_mode.175 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.176 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.177 = private unnamed_addr constant [12 x i8] c"  48       \00"
@.str.galerkin_n_mode.178 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.179 = private unnamed_addr constant [5 x i8] c"48.0\00"
@.str.galerkin_n_mode.180 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.181 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.182 = private unnamed_addr constant [12 x i8] c"  128      \00"
@.str.galerkin_n_mode.183 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.184 = private unnamed_addr constant [6 x i8] c"128.0\00"
@.str.galerkin_n_mode.185 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.galerkin_n_mode.186 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.187 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.188 = private unnamed_addr constant [15 x i8] c"  Predictions:\00"
@.str.galerkin_n_mode.189 = private unnamed_addr constant [16 x i8] c"    A*(256)  = \00"
@.str.galerkin_n_mode.190 = private unnamed_addr constant [6 x i8] c"256.0\00"
@.str.galerkin_n_mode.191 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.192 = private unnamed_addr constant [16 x i8] c"    A*(512)  = \00"
@.str.galerkin_n_mode.193 = private unnamed_addr constant [6 x i8] c"512.0\00"
@.str.galerkin_n_mode.194 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.195 = private unnamed_addr constant [16 x i8] c"    A*(1024) = \00"
@.str.galerkin_n_mode.196 = private unnamed_addr constant [7 x i8] c"1024.0\00"
@.str.galerkin_n_mode.197 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.198 = private unnamed_addr constant [16 x i8] c"    A*(inf)  = \00"
@.str.galerkin_n_mode.199 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.200 = private unnamed_addr constant [1 x i8] c"\00"
@.str.galerkin_n_mode.201 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.galerkin_n_mode.202 = private unnamed_addr constant [61 x i8] c"#  GENERALISED SOLVER COMPLETE                             #\00"
@.str.galerkin_n_mode.203 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.galerkin_n_mode.204 = private unnamed_addr constant [60 x i8] c"#  Monotonicity: CONFIRMED across all tested N            #\00"
@.str.galerkin_n_mode.205 = private unnamed_addr constant [13 x i8] c"#  A*_inf = \00"
@.str.galerkin_n_mode.206 = private unnamed_addr constant [39 x i8] c"                                     #\00"
@.str.galerkin_n_mode.207 = private unnamed_addr constant [60 x i8] c"#  Gap N=128 to inf: < 0.001                              #\00"
@.str.galerkin_n_mode.208 = private unnamed_addr constant [62 x i8] c"#  Monotonicity: VIOLATED — investigate                   #\00"
@.str.galerkin_n_mode.209 = private unnamed_addr constant [61 x i8] c"############################################################\00"
